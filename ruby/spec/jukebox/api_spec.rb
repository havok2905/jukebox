require_relative '../../jukebox/api.rb'
require 'rack/test'

describe JukeBox::API do
  include Rack::Test::Methods

  def app
    JukeBox::API
  end
  
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
  end
end
