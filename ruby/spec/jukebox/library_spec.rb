require_relative '../../jukebox/library.rb'

describe JukeBox::Library do
  context 'class_methods' do
    before do
      JukeBox::Library.library = Hash.new
    end

    describe '.artist_init' do
      it 'sets a key for an artist if none exists' do
        JukeBox::Library.artist_init('artist', 'album', 'song')
        expect(JukeBox::Library.library.has_key?('artist')).to be true
      end
    end
    
    describe '.album_init' do
      it 'sets a key for an artists album if non exists' do
        JukeBox::Library.library['artist'] = Hash.new
        JukeBox::Library.album_init('artist', 'album', 'song')
        expect(JukeBox::Library.library['artist'].has_key?('album')).to be true
      end
    end

    describe '.song_init' do
      it 'sets the song to the artists album array' do
        JukeBox::Library.library['artist'] = Hash.new 
        JukeBox::Library.library['artist']['album'] = Hash.new
        JukeBox::Library.library['artist']['album'][:songs] = Array.new
        JukeBox::Library.song_init('song.mp4', 'artist', 'album', 'song')
        expect(JukeBox::Library.library['artist']['album'][:songs].first).to eq({:name=>"song", :path=>"song.mp4"})
      end
    end
   
    describe 'collect_music' do
      # This method really just implements to thop three methods
      # This would much better be tested as an integration test
      # of the API class that uses this.
    end
  end
end
