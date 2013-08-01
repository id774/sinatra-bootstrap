#!/opt/ruby/current/bin/ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'sinatra/base'
require 'haml'
require './storage'

class SinatraBootstrap < Sinatra::Base
  # require './helpers/render_partial'

  def initialize(app = nil, params = {})
    super(app)
    # TODO: implement
    @storage = Storage.new
  end

  get '/' do
    @contents = Content.all
    haml :index
  end

  post '/new' do
    content = Content.new
    content.id = params[:id]
    content.key = params[:key]
    content.value = params[:value]
    content.save
    redirect '/'
  end

  run! if app_file == $0
end
