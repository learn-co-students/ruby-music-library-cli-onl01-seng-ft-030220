require "pry"

class Genre

    extend Concerns::Findable

    attr_accessor :name, :artist, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
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

    def self.create(name)
        self.new(name)
    end

    def artists
        artists = @songs.collect {|song| song.artist}
        artists.uniq
    end

end