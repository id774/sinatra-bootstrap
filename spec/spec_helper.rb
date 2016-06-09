# coding: utf-8

ENV['RACK_ENV'] = "test"

require File.dirname(__FILE__) + '/../app'
require File.dirname(__FILE__) + '/../lib/storage'
require File.dirname(__FILE__) + '/../lib/paginate'

require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  SinatraBootstrap
end
