require_relative '../../jukebox/library.rb'

describe JukeBox::Library do
  context 'assignment' do
    context 'class variables' do
      it 'should assign Library' do
        expect(JukeBox::Library.library).to eq(Hash.new)
      end
    end
  end

  context 'class_methods' do
    describe '.artist_init' do
      it 'it sets a key for an artist if none exists' do
        JukeBox::Library.artist_init('artist', 'album', 'song')
        expect(JukeBox::Library.library.has_key?('artist')).to be_truthy
      end
    end
    
    describe '.album_init' do
    end

    describe '.song_init' do
    end
   
    describe 'collect_music' do
    end
  end
end
