require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'active_record'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection('development')

class Content < ActiveRecord::Base
end

class SinatraBootstrap < Sinatra::Base
  require './helpers/render_partial'

  def initialize(app = nil, params = {})
    super(app)
    # TODO: implement
  end

  get '/' do
    @contents = Content.all
    haml :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
