
require "pry"

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(name)
    self.songs << name
    name.artist = self
  end

  def self.find_by_name(name)
    @@all.detect {|songs| songs.name == name}
  end

  def self.create_by_name(name)
    song = self.new(name)
    @@all << song
    song
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_artist = self.new(name)
      new_artist.save
      new_artist
    else
      self.find_by_name(name)
    end
  end

  def print_songs
    songs.each { |song| puts song.name  }

  end


end
