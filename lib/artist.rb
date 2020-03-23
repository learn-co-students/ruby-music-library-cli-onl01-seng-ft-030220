require "pry"

class Artist

    attr_accessor :name

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
        new_artist = Artist.new(name)
        @@all << new_artist
        return new_artist
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

end