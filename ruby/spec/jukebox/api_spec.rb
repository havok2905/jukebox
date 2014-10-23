require_relative '../../jukebox/api.rb'
require 'rack/test'
require 'pry'
describe JukeBox::API do
  include Rack::Test::Methods

  def app
    JukeBox::API
  end

  let(:path){ '/srv/music//Clutch/Blast Tyrant/01 - Mercury.mp3' }
  let(:song){ '01-Mercury' }
  let(:song_file){ '01 - Mercury.mp3' }
  let(:album){ 'Blast Tyrant' }
  let(:artist){ 'Clutch' }

  describe 'GET /api/v1/library/collection' do
    before do
      get '/api/v1/library/collection'
    end

    it 'is successful' do
      expect(last_response.status).to eq(200)
    end

    it 'should return an object containing the full music library' do
      # I'm just testing that the format of the object is correct
      # and tha an album has songs.
      response = JSON.parse last_response.body
      test_songs = response[artist][album]['songs']
      expect(test_songs.count).to be > 0
    end
  end

  describe 'GET /api/v1/library/artists' do
    before do
      get '/api/v1/library/artists'
    end

    it 'is successful' do
      expect(last_response.status).to eq(200)
    end

    it 'should return a list of artists' do
      response = JSON.parse last_response.body
      expect(response.count).to be > 0
      expect(response.include? artist).to be true
    end
  end

  describe 'GET /api/v1/library/artist_songs' do
    before do
      get '/api/v1/library/artist_songs?artist=Clutch'
    end

    it 'is successful' do
      expect(last_response.status).to eq(200)
    end

    it 'should return a list of songs' do
      response = JSON.parse last_response.body
      expect(response.count).to be > 0
      info = [artist, album, song_file, path]
      expect(response.include? info).to be true
    end
  end

  describe 'GET /api/v1/library/album_songs' do
    before do
      get '/api/v1/library/album_songs?artist=Clutch&album=Blast%20Tyrant'
    end

    it 'is successful' do
      expect(last_response.status).to eq(200)
    end

    it 'should return a list of songs' do
      response = JSON.parse last_response.body
      expect(response.count).to be > 0
      info = [artist, album, song_file, path]
      expect(response.include? info).to be true
    end
  end

  describe 'GET /api/v1/library/artist_albums' do
    before do
      get '/api/v1/library/artist_albums?artist=Clutch'
    end

    it 'is successful' do
      expect(last_response.status).to eq(200)
    end

    it 'should return a list of albums' do
      response = JSON.parse last_response.body
      expect(response.count).to be > 0
      expect(response.include? album).to be true
    end
  end
end
