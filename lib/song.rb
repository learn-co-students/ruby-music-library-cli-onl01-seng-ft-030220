require "pry"

class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        save
        if artist != nil
            self.artist = artist
        end
        if genre != nil
            self.genre = genre
        end
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
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

    def self.create(name)
        self.new(name)
    end

    def self.find_by_name(name)
        @@all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name (song_name)
    song = self.find_by_name(song_name)
        if song
            return song
        else
            self.create(song_name)
        end
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end

    def self.new_from_filename(filename)
        array = filename.split(" - ")
    
        song_name = array[1]
        artist_name = array[0]
        genre_name = array[2].split(".mp3").join
    
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)
    end

end

