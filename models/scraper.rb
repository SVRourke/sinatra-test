class DataInterface
    def initialize(key = '')
        @key = key
        @display = "name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku,image"
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

    def buildBase()
        "customerReviewAverage>4&customerReviewCount>100&onSale=true"
        b_url = "https://api.bestbuy.com/v1/products(#{filters})"
    end


    def buildRequest(base_url, pageSize=20, page )
        attribs = "name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku,image"
        req = Typhoeus::Request.new(
            base_url,
            method: :get,
            params: {
                show: attribs,
                format: 'json',
                pageSize: pageSize,
                page: page,
                apiKey: @key
        })
    end


end




