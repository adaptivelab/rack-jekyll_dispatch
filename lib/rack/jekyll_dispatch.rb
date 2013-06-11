module Rack
  autoload :VERSION, 'rack/jekyll_dispatch/version'
  autoload :FileHandler, 'rack/jekyll_dispatch/file_handler'

  class JekyllDispatch
    def initialize(app,opts={})
      @app = app
      path = (opts[:source].nil?) ? Dir.pwd + "/public/jekyll" : opts[:source]
      @file_handler = FileHandler.new(path)
    end

    def call(env)
      case env['REQUEST_METHOD']
      when 'GET', 'HEAD'
        path = env['PATH_INFO'].chomp('/')
        if match = @file_handler.match?(path)
          env["PATH_INFO"] = match
          return @file_handler.call(env)
        end
      end

      @app.call(env)
    end
  end
end
