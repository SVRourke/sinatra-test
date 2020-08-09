require_relative './../config/environment.rb'

class App < Sinatra::Base
    enable :sessions

    get '/page' do
        redirect to('/page/1')
    end

    post '/page' do
        # redirect to('/test')
        session[:filters] = "SAVED FILTER"
        redirect to('/page/1')
    end

     get '/page/:num' do
        ix = DataInterface.new('AngmDMbjxfx9GEcQ2kDDTwtk')
        @data = ix.getPage(page = params[:num])
        @login = session[:filters]
        erb :layout
    end



end