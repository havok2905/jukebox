require_relative '../../jukebox/library.rb'
require_relative '../../media_config.rb'

describe JukeBox::Library do
  context 'instance_methods' do
    before do
      @library = JukeBox::Library.new MediaConfig::MUSIC_LIBRARY
    end

    describe '.artist_init' do
      it 'sets a key for an artist if none exists' do
        @library.artist_init('artist')
        expect(@library.library.has_key?('artist')).to be true
      end
    end

    describe '.album_init' do
      it 'sets a key for an artists album if non exists' do
        @library.library['artist'] = Hash.new
        @library.album_init('artist', 'album')
        expect(@library.library['artist'].has_key?('album')).to be true
      end
    end

    describe '.song_init' do
      it 'sets the song to the artists album array' do
        @library.library['artist'] = Hash.new
        @library.library['artist']['album'] = Hash.new
        @library.library['artist']['album'][:songs] = Array.new
        @library.song_init('artist', 'album', 'song', 'song.mp4')
        expect(@library.library['artist']['album'][:songs].first).to eq({:name=>"song", :path=>"song.mp4"})
      end
    end

    describe 'collect_music' do
      # This method really just implements to thop three methods
      # This would much better be tested as an integration test
      # of the API class that uses this.
    end

    describe 'artists' do
      let(:artist){ 'Clutch' }
      it 'rertrieves artists' do
        expect(@library.artists.count).to be > 0
      end

      it 'retirves a specific artist' do
        expect(@library.artists.include? artist).to be true
      end
    end
  end
end
