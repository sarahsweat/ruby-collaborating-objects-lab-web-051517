class Song
 attr_accessor :artist , :name

 def initialize(name)
   @name = name
 end

 def self.new_by_filename(file_name)
   parsed = file_name.split(/ - /)

   artist_name = parsed[0]
   song_name = parsed[1]
   song = Song.new(song_name)
   song.artist = Artist.find_or_create_by_name(artist_name)
  #  binding.pry
   song.artist.songs << song.artist
   unless song.artist.nil?
     song.artist.songs << song.name
   end
   song
 end

end
