#!/opt/ruby/current/bin/ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'sinatra/base'
require 'haml'
require './lib/storage'
require 'will_paginate'
require 'will_paginate/active_record'
require 'will_paginate/view_helpers'
require 'will_paginate/view_helpers/sinatra'
require "will_paginate-bootstrap"

class SinatraBootstrap < Sinatra::Base
  # require './helpers/render_partial'
  include WillPaginate::Sinatra::Helpers

  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end

    def paginate
      will_paginate @contents, :renderer => BootstrapPagination::Sinatra
    end
  end

  def initialize(app = nil, params = {})
    super(app)
    # TODO: implement
    @storage = Storage.new
  end

  get '/' do
    @contents = Content.paginate(:page => params[:page])
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
