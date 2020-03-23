class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs, :song
  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
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

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end




end
