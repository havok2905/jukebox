require_relative '../../file/music.rb'

describe FileItem::Music do
  let(:music){ FileItem::Music.new('/srv/music/artist/album/song.mp4') }

  context 'initialization' do
    let(:path){ '/srv/music/artist/album/song.mp4' }
    let(:path_list){ ['artist', 'album', 'song.mp4'] }
    let(:pattern){ ['artist', 'album', 'song']  }
    let(:artist){ 'artist' }
    let(:album){ 'album' }
    let(:song){ 'song.mp4' }

    it 'initializes' do
      expect(music).to be_truthy
    end

    it 'should assign valid instance variables' do
      expect(music.path).to eq(path)
      expect(music.path_list).to match_array(path_list)
      expect(music.pattern).to match_array(pattern)
      expect(music.artist).to eq(artist)
      expect(music.album).to eq(album)
      expect(music.song).to eq(song)
    end
  end

  context 'instance methods' do
    describe '.audio?' do
      it 'returns true if the music is an audio file' do
        expect(music.audio?).to be_truthy
      end
    end

    describe '.name' do
      it 'should not contain a file extension' do
        expect(music.name).to eq('song')
      end
    end

    describe '.info' do
      it 'should return info about the song' do
        expect(music.info).to match_array(['artist', 'album', 'song'])
      end
    end
  end
end
