require './media_config.rb'
require './file/music.rb'

module JukeBox
  class Library

    class << self
      attr_accessor :library

      def artist_init(artist, album, song)
        unless @library.has_key? artist
          @library[artist] = {}
        end
      end

      def album_init(artist, album, song)
        unless @library[artist].has_key? album
          @library[artist][album] = { songs: [] }
        end
      end

      def song_init(file, artist, album, song)
        @library[artist][album][:songs] << { name: song, path: file }
      end

      def collect_music
        Dir["#{MediaConfig::MUSIC_LIBRARY}*/*/*"].each do |file|
          song = FileItem::Music.new file
          if song.audio?
            artist_init *song.info
            album_init *song.info
            song_init file, *song.info
          end
        end

        @library
      end
    
      def simple_query(pattern)
        Dir["#{MediaConfig::MUSIC_LIBRARY}#{pattern}"].map do |file|
          file.split('/').last
        end.uniq
      end

      def query(pattern)
        Dir["#{MediaConfig::MUSIC_LIBRARY}#{pattern}"].map do |file|
          song = FileItem::Music.new file
          response = song.info
          response << file
          response if song.audio?
        end.uniq.select do |song|
          song unless song.nil?
        end
      end

      def artists
        self.simple_query '/*'
      end
      
      def artist_albums(artist)
        self.simple_query "/#{artist}/*"
      end

      def album_songs(artist, album)
        self.query "/#{artist}/#{album}/*"
      end

      def artist_songs(artist)
        self.query "/#{artist}/*/*"
      end
    end

    @library = Hash.new
  end
end
