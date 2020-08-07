require 'typhoeus'
require 'json'
require 'pry'

base_url = "https://api.bestbuy.com/v1/products(customerReviewAverage>4&customerReviewCount>100&onSale=true)?show=name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku&format=json&pageSize=50&page=50&apiKey=AngmDMbjxfx9GEcQ2kDDTwtk"
base = "https://api.bestbuy.com/v1/products(customerReviewAverage>4&customerReviewCount>100&onSale=true)?show=name,url,customerReviewAverage,priceUpdateDate,salePrice,dollarSavings,sku"

# uri = URI(base_url)
# resp = HTTParty.get(uri)

# req = Typhoeus::Request.new(base_url).run
req = Typhoeus::Request.new(
    base,
    method: :get,
    params: {
        format: 'json',
        pageSize: 50,
        page: 5,
        apiKey: 'AngmDMbjxfx9GEcQ2kDDTwtk'
    }
).run

body = JSON.parse(req.response_body)

binding.pry

# BODY KEYS = ["from", "to", "currentPage", "total", "totalPages", "queryTime", "totalTime", "partial", "canonicalUrl", "products"]
