require "pry"

class Genre

    attr_accessor :name, :artist

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
        new_genre = Genre.new(name)
        @@all << new_genre
        return new_genre
    end

end