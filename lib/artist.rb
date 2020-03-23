require 'pry'
class Artist  
  extend Concerns::Findable 
  attr_accessor :name
  
  @@all = [] 
  
  def initialize(name)
    @name = name
    @songs = []

   # @@all << self 
  end
  
  def self.all 
    @@all
  end
  
  def songs 
    @songs 
  end
  

  def genres 
    songs.map{|song| song.genre}.uniq
  end
  

  def self.destroy_all 
    @@all = []
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(artist_name)
    new_artist = Artist.new(artist_name)
    new_artist.save 
    new_artist
  end
  
  def add_song(song)

    song.artist = self unless song.artist 
    songs.push song unless songs.include? song  

    if song.artist == nil 
    song.artist = self 
    @songs << song 
  end
  end
    
    
  
end