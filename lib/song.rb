class Song 
extend Concerns::Findable
@@all = []
attr_accessor :name,:artist, :genre

def initialize(name, artist=nil, genre=nil)
  @name = name 
  self.artist=(artist) if artist != nil
  self.genre=(genre) if genre != nil
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
def self.create(song)
 song = self.new(song)
 song.save
 song
end
def artist
  @artist 
end
def artist=(artist)
  @artist = artist 
  artist.add_song(self)
end
def genre=(genre)
  @genre = genre 
   genre.songs << self unless genre.songs.include?(self)
  end
 def self.new_from_filename(filename)
    file_array = filename.split(" - ")

    song_name = file_array[1]
    artist_name = file_array[0]
    genre_name = file_array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
end 
end