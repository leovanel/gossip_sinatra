require 'csv'
require 'pry'
$:.unshift File.expand_path("./the_gossip_project_sinatra", __FILE__)
class Gossip
  attr_accessor :author , :content
  def initialize (author,content)
    @author=author
    @content=content
  end


  def save
    CSV.open("./db/gossip.csv", "ab") do |csv| #ajoute les variables de la nouvelle instance de la classe gossip au CSV
      csv << [@author, @content] 
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line| #lit chaque ligne du CSV
                
      all_gossips << Gossip.new(csv_line[0], csv_line[1])  #ajoute les données de chaque ligne dans l'array all_gossips
    end
    return all_gossips 
  end

  def self.find(id)
    all_gossips = self.all
    index=id.to_i - 1 #convertit l'id stocké dans params en integer , et le décale d'un rang car l'array commence à 0
    gossip_id = all_gossips[index] # enregistre l'entrée de l'array correspondante  à l'id voulue
    puts gossip_id
    return gossip_id # return le gossip recherché pour l'afficher dans la page /gossips/:id
  end

  def self.update(author,content,id)
    
    tab_row = CSV.read("./db/gossip.csv") #on crée un array à partir du CSV
    tab_row[id][0]= author #on définis l'argument author à partir de ses "coordonnées", son id et le rang 0
    # qui correspond à l'auteur dans l'array
    tab_row[id][1]= content # idem pour le content
    
    CSV.open("./db/gossip.csv", "wb") { |csv| tab_row.each{|row| csv << row}}#on crée un nouveau CSV d'aprés les modifications qu'on vient de faire
    
    
  end
  
  

end