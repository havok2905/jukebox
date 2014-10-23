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

      # Overwrite this method in child classes
      def valid_type?
      end

      # Overwrite this method in child classes
      def info
      end
    end
  end
end
