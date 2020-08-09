require 'typhoeus'
require 'json'
require 'pry'

base_url = "https://api.bestbuy.com/v1/products(customerReviewAverage>4&customerReviewCount>100&onSale=true)?show=name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku&format=json&pageSize=50&page=50&apiKey=AngmDMbjxfx9GEcQ2kDDTwtk"
base = "https://api.bestbuy.com/v1/products(customerReviewAverage>4&customerReviewCount>100&onSale=true)"

# uri = URI(base_url)
# resp = HTTParty.get(uri)

class DataInterface
    def initialize(key = '')
        @key = key
        @display = "name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku,manufacturer"
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


# req = Typhoeus::Request.new(base_url).run
# req = Typhoeus::Request.new(
#     base,
#     method: :get,
#     params: {
#         show: "name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku",
#         format: 'json',
#         pageSize: 50,
#         page: 5,
#         apiKey: 'AngmDMbjxfx9GEcQ2kDDTwtk'
#     }).run

# body = JSON.parse(req.response_body)

ix = DataInterface.new(key = 'AngmDMbjxfx9GEcQ2kDDTwtk')

binding.pry

# BODY KEYS = ["from", "to", "currentPage", "total", "totalPages", "queryTime", "totalTime", "partial", "canonicalUrl", "products"]
