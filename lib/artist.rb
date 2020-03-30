class Artist 
  
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
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
  self.class.all << self 
end 

def self.create(name)
  created_artist = self.new(name)
  created_artist.save
  created_artist
  end 

 
 def add_song(song)
   if !song.artist 
     song.artist = self 
   end 
   if !@songs.include?(song)
       @songs << song
 end
 
end 

def genres
  @new_array = []
  @songs.each do |song|
  if @new_array.include?(song.genre)
    nil 
  else 
    @new_array << song.genre
  end 
end 
    @new_array
end 

end 
