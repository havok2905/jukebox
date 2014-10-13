require './media_config.rb'

module JukeBox
  class Library
    class << self

      attr_accessor :library

      def music?(file)
        /([^\s]+(\.(?i)(mp3|mp4|m4p|m4a))$)/.match file
      end

      def pretty_print(song)
        song.gsub(/[.mp3, .mp4, .m4p, .m4a]/, '')
      end

      def collect_music
        library = Hash.new

        files = Dir["#{MediaConfig::MUSIC_LIBRARY}*/*/*"]

        files.each do | file |
          path_list = file.split('/').select do |dir|
            dir != '' || dir != '.' || entry != '..'
          end

          path_list.shift( path_list.count - 3 )

          artist = path_list[0]
          album  = path_list[1]
          song   = path_list[2]

          if music?(song) && !File.directory?(file)
            unless library.has_key? artist
              library[artist] = {}
            end

            unless library[artist].has_key? album
              library[artist][album] = { songs: [] }
            end

            library[artist][album][:songs] << { name: pretty_print(song), path: file }
          end
        end

        @library = library
        library
      end
    end
  end
end
