require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author,content)
    @author = author
    @content = content
  end

  def save #sauvergarde les gossip dans un fichier CSV
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author,@content]
    end
  end

  def self.all #retourne tout les potins
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id) #cherche un potins en fonctions de son numéro
    CSV.foreach("./db/gossip.csv").with_index do |csv_line, index|
      return gossip = Gossip.new(csv_line[0], csv_line[1]) if index == id.to_i
    end
  end
  
end