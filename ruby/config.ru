require 'rubygems'
require 'rack'
require 'rack/cors'
require './jukebox/api.rb'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

run JukeBox::API
