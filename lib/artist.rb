class Artist 
  
@@all = []

attr_accessor :genre, :name 

extend Concerns::Findable


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
  artist = self.new(name)
  artist.save
  artist
end 

def songs
  @songs
end 

def add_song(song)
  if !@songs.include?(song)
    @songs << song
    song.artist = self if song.artist.nil?
  end 

def genres 
  @songs.map {|map| map.genre}.uniq
end
end
  
end 

