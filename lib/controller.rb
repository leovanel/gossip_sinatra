require_relative 'gossip'
class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
    
  end 
  post '/gossips/new/' do
    params["gossip_author"]
    params["gossip_content"]
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params['id'] is 'foo' or 'bar'
    Gossip.find(params['id'])
    erb :show #, locals: {gossips: Gossip.find(params['id'])}
  end

  get '/gossips/:id/edit/' do
    Gossip.find(params['id'])
    erb :edit
  end 

  post '/gossips/:id/edit/' do
    id= (params['id'].to_i)-1
    Gossip.update(params["gossip_author"], params["gossip_content"],id)#pas les bon params?
    redirect '/'
  end 

  

end
