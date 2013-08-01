#!/opt/ruby/current/bin/ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'sinatra/base'
require 'haml'
require './storage'

class SinatraBootstrap < Sinatra::Base
  require './helpers/render_partial'

  def initialize(app = nil, params = {})
    super(app)
    # TODO: implement
  end

  get '/' do
    storage = Storage.new
    @contents = Content.all
    haml :index
  end

  run! if app_file == $0
end
