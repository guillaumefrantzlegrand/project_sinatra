require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/:id' do 
    erb :gossips, locals: {gossips: Gossip.find(params["id"])}
  end
  get '/gossips/new/' do 
    erb :new_gossip
  end
  get '/gossips/edit/:id' do 
    erb :edit, locals: {gossips: Gossip.find(params["id"])}
  end
  post '/gossips/edit/:id' do
    Gossip.find(params["id"])
    Gossip.edit(params["gossip_author"], params["gossip_content"], params["id"])
    redirect '/gossips/success/'
  end
  get '/gossips/success/' do
    erb :success, locals: {gossips: Gossip.all}
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
end