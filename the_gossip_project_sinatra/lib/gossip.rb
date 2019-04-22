class Gossip
  attr_accessor :author, :content, :id

  def initialize(author, content)
    @author = author 
    @content = content
  end
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  def self.all
    all_gossips = []
    CSV.foreach("./db/gossip.csv") do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = self.all 
    return all_gossips[id.to_i]
  end

  def self.edit(new_author, new_content, id)
    all_gossips = self.all 
    p all_gossips
    p "ouech #{all_gossips.index(id)}"
    puts "L'id est #{id}"
    puts new_content
    puts new_author
  end
end