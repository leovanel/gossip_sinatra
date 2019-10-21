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
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line| 
                
      all_gossips << Gossip.new(csv_line[0], csv_line[1])  
    end
    return all_gossips 
  end

  def self.find(id)
    all_gossips = self.all
    index=id.to_i - 1
    gossip_id = all_gossips[index]
    puts gossip_id
    return gossip_id
  end

  def self.update(author,content,id)
    
    tab_row = CSV.read("./db/gossip.csv") #on crée un array à partir du CSV
    tab_row[id][0]= author
    tab_row[id][1]= content
    CSV.open('.db/gossip.csv', 'wb') { |csv| tab_row.each{|row| csv << row}}
    
    
  end
  
  

end