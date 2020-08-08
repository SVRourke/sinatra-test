require_relative './../config/environment.rb'

class App < Sinatra::Base
    get '/' do
        "this is the search page"
    end

    get '/results' do
        ix = DataInterface.new('AngmDMbjxfx9GEcQ2kDDTwtk')
        @data = ix.getPage(page = 1)
        puts @data[:products][0]['url']
        erb :results
    end

end