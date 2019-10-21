require_relative 'gossip'
class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all} #affiche le contenu du fichier index.erb sur la page d'accueil(localhost...)
    #ainsi que le résultat de la méthode de Classe Gossip.all => chaque entrée de l'array obtenu à partir du CSV
  end

  get '/gossips/new/' do
    erb :new_gossip # affiche le contenu du fichier new_gossip.erb pour l'adresse /gossips/new/
    
  end 
  post '/gossips/new/' do
    params["gossip_author"] #stocke les informations saisies dans l'input 'gossip_author' dans le hash params
    params["gossip_content"] # idem pour l'input 'gossip_content'
    Gossip.new(params["gossip_author"], params["gossip_content"]).save #applele la méthode de classe Gossip.new,
    # qui crée un nouveau gossip et l'initialise avec les données stockées dans params
    redirect '/' # redirige l'utilisateur vers la page d'accueil(index)
  end

  get '/gossips/:id' do #on crée une route dynamique vers chaque gossip avec la variable id
    
    Gossip.find(params['id']) #on appele la méthode de classe Gossip.find 
    #avec l'id stockée dans params pour trouver le gossip correspondant
    erb :show #affiche le contenu du fichier show.erb
  end

  get '/gossips/:id/edit/' do
    Gossip.find(params['id']) 
    erb :edit  #affiche le contenu du fichier edit.erb
  end 

  post '/gossips/:id/edit/' do
    id= (params['id'].to_i-1) #definit l'id du gossip souhaité
    Gossip.update(params["gossip_author"], params["gossip_content"],id)#appele la méthode update sur la classe Gossip, avec en 
    #arguments les données saisie par l'utilisateur dans les imputs gossip_author et gossip_content, et l'id correspondant.
    redirect '/'  #retour à l'index
  end 

  

end
