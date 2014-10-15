require './file/file.rb'

module File
  class Music < File

    def initialize(path, pattern)
      path_list = self.split_path path
      path_list = self.remove_root path, pattern

      @path    = path
      @pattern = pattern
      @artist  = path_list[0]
      @album   = path_list[1]
      @song    = path_list[2]
    end

    def audio?
      /([^\s]+(\.(?i)(mp3|mp4|m4p|m4a))$)/.match @path
    end

    def name
      @song.gsub(/[.mp3, .mp4, .m4p, .m4a]/, '')
    end

    def info
      [@artist, @album, name]
    end
  end
end
