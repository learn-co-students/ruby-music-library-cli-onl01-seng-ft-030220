class MusicImporter
  
 attr_reader :path
 
  def initialize(path)
    @path = path
  end

  def files
    file_array = []
    files = Dir.open(@path)
    files.each do |file|
      if file.include?(".mp3")
        file_array << file
      end 
    end
    file_array
  end 

def import
  self.files.each {|file| Song.create_from_filename(file)}
end 
  
end
  
  