require 'json'

library_path = '/Volumes/The Void/backup/media/audio/music/'
library = {}

def music? file
  /([^\s]+(\.(?i)(mp3|mp4|m4p|m4a))$)/.match file
end

files = Dir["#{library_path}*/*/*"]

files.each do | file |
  path_list = file.split('/').select do |dir|
    dir != '' || dir != '.' || entry != '..'
  end

  path_list.shift( path_list.count - 3 )

  artist = path_list[0]
  album  = path_list[1]
  song   = path_list[2]

  if music?(song) && !File.directory?(song)

    unless library.has_key? artist
      library[artist] = {}
    end

    unless library[artist].has_key? album
      library[artist][album] = { songs: [] }
    end

    library[artist][album][:songs] << { name: song.gsub(/[.mp3, .mp4, .m4p, .m4a]/, ''), path: file }
  end
end

puts JSON.generate(library)
