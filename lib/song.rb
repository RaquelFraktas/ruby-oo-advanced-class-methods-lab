require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    # binding.pry
    song = self.new #local vars, its ok to name it song like the above method
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name (thing)
    @@all.find do|song| 
        song.name == thing
    end
  end 

  def self.find_or_create_by_name(song_name)
      if self.find_by_name(song_name) #checks to see if its true
        self.find_by_name(song_name) #runs that code if song exists
        #what the hell!??!!? why does this return the instance/object? doesnt it return truthy?
      else
        self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
    song.name
    end
  end

  def self.new_from_filename(song_name)
   song_array = song_name.split(/ - |.mp3/)
   artist_name_pulled = song_array[0]
   name_pulled = song_array[1]
   song = self.create_by_name(name_pulled)
    song.artist_name = artist_name_pulled
    song
  end

  def self.create_from_filename(song_name)
    song_array = song_name.split(/ - |.mp3/)
    artist_name_pulled = song_array[0]
    name_pulled = song_array[1]
    song = self.create_by_name(name_pulled)
    song.artist_name = artist_name_pulled
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
