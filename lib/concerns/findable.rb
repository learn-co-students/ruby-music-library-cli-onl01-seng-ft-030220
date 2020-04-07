module Concerns::Findable

  def find_by_name(name)
      self.all.find {|song| song.name == name}
  end

  def find_or_create_by_name (song_name)
      song = self.find_by_name(song_name)
      if song
          return song
      else
          self.create(song_name)
      end
  end

end