require 'grape'
require './jukebox/library.rb'
require './media_config.rb'

module JukeBox
  class API < Grape::API
    version 'v1', using: :path, vendor: 'jukebox'
    format :json
    prefix :api

    helpers do
      def library
        JukeBox::Library.new MediaConfig::MUSIC_LIBRARY
      end
    end

    resource :library do
      desc 'return a a music library organizaed by artist, album, and song'
      get :collection do
        library.collect_music
      end

      desc 'returns a list of artists'
      get :artists do
        library.artists
      end

      desc 'returns a list of an artists albums'
      params do
        requires :artist, type: String, desc: 'artist name'
      end
      get :artist_albums do
        library.artist_albums params[:artist]
      end

      desc 'returns a list of songs in a given album'
      params do
        requires :artist, type: String, desc: 'artist name'
        requires :album, type: String, desc: 'album name'
      end
      get :album_songs do
        library.album_songs params[:artist], params[:album]
      end

      desc 'returns an artists songs by album'
      params do
        requires :artist, type: String, desc: 'artist name'
      end
      get :artist_songs do
        library.artist_songs params[:artist]
      end
    end
  end
end
