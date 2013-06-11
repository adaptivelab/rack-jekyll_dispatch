# Rack::JekyllDispatch
====================

Rack middleware that allows Jekyll content to be served from a static directory within your Rack application. Derived from how Rails serves static content from ActionDispatch::Static.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-jekyll_dispatch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-jekyll_dispatch

## Usage

Within a Rails app.

    config.middleware.insert_before('Rack::Lock', 'Rack::JekyllDispatch')

The default source for the generated Jekyll files is 'public/jekyll', if you want specify the source then :

    config.middleware.insert_before('Rack::Lock', 'Rack::JekyllDispatch', :source => "#{config.root}/public/zomglolz")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

Add tests!
