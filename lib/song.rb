require "pry"

class Song

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
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

    def self.create(name)
        new_song = Song.new(name)
        @@all << new_song
        return new_song
    end


end