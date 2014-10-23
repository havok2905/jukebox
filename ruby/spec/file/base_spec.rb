require_relative '../../file/base.rb'

describe FileItem do
  context 'class methods' do
    describe '.split_path' do
      it 'should give me back an array of path steps' do
        path = 'foo/bar/foobar'
        result = FileItem::Base.split_path path
        expect(result).to match_array(['foo', 'bar', 'foobar'])
      end

      it 'should not include directory navigators' do
        path = '/./../foo/bar/foobar'
        result = FileItem::Base.split_path(path)
        expect(result.include?('')).to be_falsey
        expect(result.include?('.')).to be_falsey
        expect(result.include?('..')).to be_falsey
      end
    end

    describe '.remove_root' do
      it 'should give me the last parts of a path' do
        path = ['foo' ,'bar', 'foo', 'artist', 'album', 'song.mp4']
        expected = ['artist', 'album', 'song.mp4']
        pattern = ['artist', 'album', 'song' ]
        result = FileItem::Base.remove_root path, pattern
        expect(result).to match_array(expected)
      end
    end
  end
end
