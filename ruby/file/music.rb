require './file/base.rb'

module FileItem
  class Music < FileItem::Base

    def initialize(path)

      pattern = ['artist', 'album', 'song']
      path_list = self.class.split_path path
      path_list = self.class.remove_root path_list, pattern

      @path      = path
      @path_list = path_list
      @pattern   = pattern
      @artist    = path_list[0]
      @album     = path_list[1]
      @song      = path_list[2]
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
