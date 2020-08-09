class DataInterface
    def initialize(key = '')
        @key = key
        @display = "name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku,image"
        @base = "https://api.bestbuy.com/v1/products(customerReviewAverage>4&customerReviewCount>100&onSale=true)"
    end
    
    # def getPage(page = 1)
    #     req = Typhoeus::Request.new(
    #         @base,
    #         method: :get,
    #         params: {
    #             show: @display,
    #             format: 'json',
    #             pageSize: 100,
    #             page: page,
    #             apiKey: @key
    #     }).run

    #     body = JSON.parse(req.response_body)

    #     results = {
    #         :page => body['currentPage'],
    #         :pages => body['totalPages'],
    #         :products => body['products']
    #     }
    # end
    
    def getPagenew(filters, page)
        req = buildRequest(filters, page )
        # req.run

        body = JSON.parse(req.response_body)

        results = {
            :page => body['currentPage'],
            :pages => body['totalPages'],
            :products => body['products']
        }
    end

    def buildBase(filters)
        base = []
        filters.each do |key, value|
            if value != "" && key != "pageSize"
                base << "#{key.to_s}#{value}"
            end                
        end
        b_url = "https://api.bestbuy.com/v1/products(#{base.join("&")}&onSale=true)"
    end


    def buildRequest(filters, page )
        attribs = "name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku,image"
        base_url = buildBase(filters)
        puts base_url
        req = Typhoeus::Request.new(
            base_url,
            method: :get,
            params: {
                show: attribs,
                format: 'json',
                pageSize: filters["pageSize"],
                page: page,
                apiKey: @key
        }).run
    end


end


