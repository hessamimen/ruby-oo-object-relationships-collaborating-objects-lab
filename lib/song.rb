class Song 
attr_accessor :name, :artist
@@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename) 
        artist_name_str = filename.split(" - ")[0]
        song = filename.split(" - ")[1]
        new_song = self.new(song)
        new_song.artist_name = artist_name_str
        new_song

    end
    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end