require 'grape'
require './jukebox/library.rb'

module JukeBox
  class API < Grape::API
    version 'v1', using: :path, vendor: 'jukebox'
    format :json
    prefix :api

    resource :library do
      desc 'return a a music library organizaed by artist, album, and song'
      get :collection do
        JukeBox::Library.collect_music
      end
      
      desc 'returns a list of artists'
      get :artists do
        JukeBox::Library.artists
      end
    end
  end
end
