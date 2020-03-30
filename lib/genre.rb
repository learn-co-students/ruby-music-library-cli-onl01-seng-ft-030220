class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []
  
  def initialize(name)
    @name = name 
    #self.artist = artist if artist
    @songs = []
    
  
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
  created_genre = self.new(name)
 created_genre.save
 created_genre
  end 

def artists
  @new_array = []
  @songs.each do |song|
  if @new_array.include?(song.artist)
    nil 
  else 
    @new_array << song.artist
  end 
end 
    @new_array
end 


end 