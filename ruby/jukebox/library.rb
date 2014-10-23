require './file/music.rb'
require './file/library.rb'

module JukeBox
  class Library < ::FileItem::Library

    def artist_init(artist)
      unless @library.has_key? artist
        @library[artist] = {}
      end
    end

    def album_init(artist, album)
      unless @library[artist].has_key? album
        @library[artist][album] = { songs: [] }
      end
    end

    def song_init(artist, album, song, file)
      @library[artist][album][:songs] << { name: song, path: file }
    end

    def collect_music
      Dir["#{MediaConfig::MUSIC_LIBRARY}*/*/*"].each do |file|
        song = FileItem::Music.new file
        if song.valid_type?
          artist_init song.artist
          album_init song.artist, song.album
          song_init *song.info
        end
      end

      @library
    end

    def artists
      simple_query '/*'
    end

    def artist_albums(artist)
      simple_query "/#{artist}/*"
    end

    def album_songs(artist, album)
      query "/#{artist}/#{album}/*", ::FileItem::Music
    end

    def artist_songs(artist)
      query "/#{artist}/*/*", ::FileItem::Music
    end
  end
end
