class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    filename = filename.split(' - ')
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2].delete_suffix('.mp3'))
    name = filename[1]

    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create(name)
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if !genre.songs.include?(self)
      @genre = genre
      genre.songs << self
    end
  end
end
