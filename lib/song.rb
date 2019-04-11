require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

def Song.create
    song = self.new
    song.save
    song
  end
  
def Song.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
end

def Song.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
end

def Song.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
end

def Song.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
end

def Song.alphabetical
    self.all.sort_by { |song| song.name }
end

 def Song.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

def Song.destroy_all
    self.all.clear
  end
