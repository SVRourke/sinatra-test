require_relative './../config/environment.rb'

class App < Sinatra::Base
    get '/' do
        "this is the search page"
    end

    get '/results' do
        "this is the results page"
    end

end