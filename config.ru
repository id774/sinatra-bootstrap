require 'rubygems'
require 'sinatra'
require 'logger'
require './lib/applog'
require './app'

logdir = File.dirname(__FILE__) + "/log"
logger = ::Logger.new(logdir + '/app.log')

def logger.write(msg)
  self << msg
end

use AppLog, logger
use Rack::CommonLogger, logger

run SinatraBootstrap
