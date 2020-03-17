class MusicLibraryController

  attr_reader :library

  def initialize(path='./db/mp3s')
    @library = MusicImporter.new(path)
    @library.import
  end

  def call
    puts "Welcome to your music library!"
    while true
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip

      if input == 'exit'
        break
      elsif input == 'list songs'
        self.list_songs
      elsif input == 'list artists'
        self.list_artists
      elsif input == 'list genres'
        self.list_genres
      elsif input == 'list artist'
        self.list_songs_by_artist
      elsif input == 'list genre'
        self.list_songs_by_genre
      elsif input == 'play song'
        self.play_song
      end
    end
  end

  def list_songs
    files = self.library.files.sort_by {|file| file.split(' - ')[1]}
    files.each.with_index do |file, i|
      file = file.delete_suffix('.mp3')
      puts "#{i+1}. #{file}"
    end
  end

  def list_artists
    artists = Artist.all.sort_by {|artist| artist.name}
    artists.each.with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}
    genres.each.with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip
    artist = Artist.find_by_name(name)
    if artist
      songs = artist.songs.sort_by {|song| song.name}
      songs.each.with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.strip
    genre = Genre.find_by_name(name)
    if genre
      songs = genre.songs.sort_by {|song| song.name}
      songs.each.with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    files = self.library.files.sort_by {|file| file.split(' - ')[1]}

    if (1..files.length).include?(input.to_i)
      song = files[(input.to_i) - 1].split(' - ')
      puts "Playing #{song[1]} by #{song[0]}"
    end
  end
end
