class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.new(path).children
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end
