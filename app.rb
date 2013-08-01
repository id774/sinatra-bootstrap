#!/opt/ruby/current/bin/ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'sinatra/base'
require 'haml'
require './lib/storage'

class SinatraBootstrap < Sinatra::Base
  # require './helpers/render_partial'

  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

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
