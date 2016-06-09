# coding: utf-8

require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = "test"

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), '..', 'lib', 'storage.rb')
require File.join(File.dirname(__FILE__), '..', 'lib', 'paginate.rb')

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Sinatra::Application
end
