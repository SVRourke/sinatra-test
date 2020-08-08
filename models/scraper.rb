# class Scraper
#     def initialize()
#         grtr = '>'
#         @base_url = "https://api.bestbuy.com/v1/products(customerReviewAverage#{grtr}=4&customerReviewCount>100&onSale=true)?show=name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku&format=json&pageSize=50&page=50&apiKey=AngmDMbjxfx9GEcQ2kDDTwtk"
        
#     end

#     def getResults
#         RestClient.get(@base_url)
#     end
# end
class DataInterface
    def initialize(key = '')
        @key = key
        @display = "name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku,largeFrontImage"
        @base = "https://api.bestbuy.com/v1/products(customerReviewAverage>4&customerReviewCount>100&onSale=true)"
    end
    
    def getPage(page = 1)
        req = Typhoeus::Request.new(
            @base,
            method: :get,
            params: {
                show: @display,
                format: 'json',
                pageSize: 100,
                page: page,
                apiKey: @key
        }).run

        body = JSON.parse(req.response_body)

        results = {
            :page => body['currentPage'],
            :pages => body['totalPages'],
            :products => body['products']
        }
    end

    def getProducts
        @products = []
        base_req = getPage(page = 1)

        (1..base_req[:pages]).each do |p|
            sleep(0.5)
            puts self.getPage(page = p)[:products].count
        end

        @products
    end
end