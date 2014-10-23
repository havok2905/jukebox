require_relative '../../file/library.rb'
require_relative '../../file/music.rb'
require_relative '../../media_config.rb'

describe FileItem::Library do

  before do
    @library = FileItem::Library.new MediaConfig::MUSIC_LIBRARY
  end

  context 'initialization' do
    describe 'assignment' do
      it 'should initialize with a library and location' do
        expect(@library.library).to be_truthy
        expect(@library.location).to be_truthy
      end
    end
  end

  context 'instance methods' do
    let(:pattern){ 'Clutch/Blast Tyrant/*' }
    let(:bad_pattern){ 'foo' }
    let(:file_type){ FileItem::Music }

    describe '.simple_query' do
      it 'should return a populated array with a valid patter' do
        expect(@library.simple_query(pattern).empty?).to be false
      end

      it 'should return an empty array with an ivalid patter' do
        expect(@library.simple_query(bad_pattern).empty?).to be true
      end
    end

    describe '.query' do
      it 'should be empty for an invalid pattern' do
        expect(@library.query(bad_pattern, file_type).empty?).to be true
      end

      it 'should not include nil values' do
        expect(@library.query(pattern, file_type).include? nil).to be false
      end
    end
  end
end
