require './media_config.rb'
require './file/music.rb'

module JukeBox
  class Library

    class << self
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
          song = File::Music.new file

          if song.audio?
            artist_init song.info
            album_init song.info
            song_init file, song.info
          end
        end

        @library = library
        library
      end
    end

  end
end
