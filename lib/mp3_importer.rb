require "pry"

class MP3Importer

  attr_accessor :path



  def initialize(path)
    @path = path
    @@path_directory = []
  end

  def files
    @@path_directory = Dir.entries(path)
    @@path_directory.select {|file_name| file_name.end_with?(".mp3")}
  end

  def import
      self.files.each{|filename| Song.new_by_filename(filename)}
  end
end
