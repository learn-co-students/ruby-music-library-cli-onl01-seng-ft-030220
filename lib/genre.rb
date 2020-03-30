 
class Genre 
  
attr_accessor :name, :artist, :song 

extend Concerns::Findable

@@all = []

def initialize(name)
  @name = name
  @songs = []
end 

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end 

def self.create(name)
  g = self.new(name)
  g.save
  g 
end

def songs
  @songs
end

def artists 
  @songs.map {|map| map.artist}.uniq 
end 
end