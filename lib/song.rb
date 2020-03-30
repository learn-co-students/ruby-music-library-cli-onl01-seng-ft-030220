require 'pry'
class Song 
  
  attr_accessor :name, :artist, :genre

@@all = []
def initialize(name, artist= nil, genre= nil)
@name = name
self.artist = artist if artist
self.genre = genre if genre


end 

def self.all
  @@all 
end 

def self.destroy_all
  all.clear
end 

def save
  self.class.all << self 
end 

def self.create(name)
  created_song = self.new(name)
  created_song.save
  created_song
  end 
  
def artist=(artist)
  @artist = artist
  artist.add_song(self)
end 

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
  
end 
def self.find_by_name(name)
  #binding.pry
    all.detect {|a| a.name == name}
    
  end
  
  def self.find_or_create_by_name(name)
 
      self.find_by_name(name) || self.create(name)
end 

def self.new_from_filename(filename)
  song_name = filename.split(" - ")[1]
  artist_name = filename.split(" - ")[0]
  genre_name = filename.split(" - ")[2].gsub(".mp3", "")
  # binding.pry
   new_song = self.new(song_name)
   new_song.artist = Artist.find_or_create_by_name(artist_name)
   new_song.genre = Genre.find_or_create_by_name(genre_name)

   new_song
 end
   
def self.create_from_filename(filename) 
new_from_filename(filename).tap{|s| s.save}

  
end 
end 



