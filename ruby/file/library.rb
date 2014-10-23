require './media_config.rb'
require './file/music.rb'

module FileItem
  class Library

    attr_accessor :library

    def initialize(location)
      @location  = location
      @library   = Hash.new
    end

    def simple_query(pattern)
      Dir["#{@location}#{pattern}"].map do |file|
        file.split('/').last
      end.uniq
    end

    # "file_type" expects a class extending FileItem::File
    def query(pattern, file_type)
      Dir["#{@location}#{pattern}"].map do |file|
        file_object = file_type.new file
        response = file_object.info
        response << file
        response if file_object.valid_type?
      end.uniq.select do |item|
        item unless item.nil?
      end
    end

  end
end
