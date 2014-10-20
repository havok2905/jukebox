module FileItem
  class Base
    class << self
      def split_path(path)
        path.split('/').select do |dir|
          dir != '' && dir != '.' && dir != '..'
        end
      end

      def remove_root(path, pattern)
        path.shift( path.count - pattern.count )
        path
      end
    end
  end
end
