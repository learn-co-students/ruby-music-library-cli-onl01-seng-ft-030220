require 'pry'
class Song 
   # extend Concerns::Findable 
  attr_accessor :name

  attr_reader :artist, :genre

  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs.push self unless genre.songs.include?(self) 
  end
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    self.artist= artist if artist 
    self.genre= genre if genre 
  end 

  @@all = [] 

  
  def self.all 
    @@all
  end
  
  def self.destroy_all 
    @@all = []
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(song)
    new_song = Song.new(song)
    new_song.save 
    new_song
    #binding.pry 
  end
  
  def self.find_by_name(name)
    all.find do |song|
      song.name == name 
    end
  end
  
  def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(file)
    artist, song, genre = file.gsub('.mp3', '').split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
    #binding.pry 
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end 
  
end