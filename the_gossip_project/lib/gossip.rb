require 'csv'

class Gossip

    attr_reader :author, :content
    attr_accessor :id
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
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
        count = 0
        tab = Gossip.all
        tab.each do |csv_line|
            if id == count
                return csv_line.author, csv_line.content
            end
            count += 1
        end
    end
end

p Gossip.find 2