module Rack
  class JekyllDispatch
    class FileHandler
      def initialize(root)
        @root          = root.chomp('/')
        @compiled_root = /^#{Regexp.escape(root)}/
        @file_server   = ::Rack::File.new(@root)
      end

      def match?(path)
        path = path.dup

        full_path = path.empty? ? @root : ::File.join(@root, escape_glob_chars(unescape_path(path)))
        paths = "#{full_path}{,.html,/index.html}"

        matches = Dir[paths]
        match = matches.detect { |m| ::File.file?(m) }
        if match
          match.sub!(@compiled_root, '')
          ::Rack::Utils.escape(match)
        end
      end

      def call(env)
        @file_server.call(env)
      end

      def ext
        @ext ||= begin
          "{,.html,/index.html}"
        end
      end

      def unescape_path(path)
        URI.parser.unescape(path)
      end

      def escape_glob_chars(path)
        path.force_encoding('binary') if path.respond_to? :force_encoding
        path.gsub(/[*?{}\[\]]/, "\\\\\\&")
      end
    end
  end
end