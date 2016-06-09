require File.dirname(__FILE__) + '/spec_helper'

describe "App" do
  include Rack::Test::Methods

  def app
    @app ||= SinatraBootstrap
  end

  it "should respond to /" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should return the correct content-type when viewing root" do
    get '/'
    expect(last_response.headers["Content-Type"]).to eq "text/html;charset=utf-8"
  end

  it "should return 404 when page cannot be found" do
    get '/404'
    expect(last_response.status).to eq 404
  end

end
