require 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new/' do
        erb :gossip_new
    end

    post '/gossips/new/' do
        Gossip.new(params[:gossip_author], params[:gossip_content]).save
        redirect '/'
    end

    get '/gossip_id/:id/' do
        erb :gossip_id, locals: {go: Gossip.find(params[:id])}
      end
end