module File
  class File
    class << self
      def split_path(path)
        path.split('/').select do |dir|
          path != '' || path != '.' || path != '..'
        end
      end

      def remove_root(path, pattern)
        path.shift( path_list.count - pattern.count )
      end
    end
  end
end
