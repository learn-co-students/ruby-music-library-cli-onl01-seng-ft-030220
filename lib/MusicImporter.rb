require "pry"

class MusicImporter

    attr_accessor :path
    
    def initialize(path)
        @path = path
    end

    def files()
        filenames =  Dir.entries(@path).select do |file|
        file.include?(".mp3")
        end
        return filenames
    end

    def import
        self.files.each {|filename| Song.create_from_filename(filename)}
    end

end

