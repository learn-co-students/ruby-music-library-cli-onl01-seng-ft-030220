class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_name)
    genre = Genre.new(genre_name)
    genre
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end




end
