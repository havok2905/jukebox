require 'grape'
require './library.rb'

module JukeBox
  class API < Grape::API
    version 'v1', using: :header, vendor: 'jukebox'
    format :json
    prefix :api

    resource :library do
      desc 'return a a music library organizaed by artist, album, and song'
      get :collection do
        JukeBox::Library.collect_music
      end
    end
  end
end
