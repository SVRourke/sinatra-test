require_relative './../config/environment.rb'

class App < Sinatra::Base
    enable :sessions
    set :session_secret, 'secret sauce'

    get '/' do
        redirect to('/pages/1')
    end    
        
    get '/pages' do
        redirect to('/pages/1')
    end

    post '/filter' do 
        session[:filters] = params
        redirect to('/pages/1')
    end

    get '/pages/:num' do
        if session[:filters]
            ix = DataInterface.new('AngmDMbjxfx9GEcQ2kDDTwtk')
            @data = ix.getPagenew(session[:filters], page = params[:num])
            erb :layout
        else
            redirect to('/default-filters')
        end
    end

    get '/default-filters' do
        session[:filters] = {
            "pageSize"=>"25",
            "salePrice"=>">=10",
            "customerReviewAverage"=>">3",
            "customerReviewCount"=>">10",
            "inStorePickup"=>""
        }
        redirect to '/pages/1'
    end

end
