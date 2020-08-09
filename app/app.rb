require_relative './../config/environment.rb'

class App < Sinatra::Base

    get '/page' do
        redirect to('/page/1')
    end


     get '/page/:num' do
        ix = DataInterface.new('AngmDMbjxfx9GEcQ2kDDTwtk')
        @data = ix.getPage(page = params[:num])
        erb :layout
    end


end