require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do #la page principale
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do #la page pour créer un gossip
    erb :new_gossip
  end

  post '/gossips/new/' do #un return des params si un submit est fait
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/' #retourne à la page principale
  end

  get '/gossips/:id' do #la page de chasue gossip
    erb :show, locals: {gossip: Gossip.find(params['id'])}
  end

end