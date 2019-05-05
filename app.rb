#!/usr/bin/ruby
require 'sinatra'
require 'sinatra/param'
require 'config'

require_relative 'lib/search'

configure do
  set :environment, :development #:production
  set :root, File.dirname(__FILE__)
  register Config
  log_dir = Settings.log_directory
  Dir.mkdir(log_dir) unless File.directory?(log_dir)
  file = File.new("#{settings.root}/#{log_dir}/sinatra-#{settings.environment}.log", 'a+')
  file.sync = true
  use Rack::CommonLogger, file
end

# GET /?q=search_pharase
get '/' do
  param :q, String, required: false
  search = Search.new(params['q'])
  erb :index, locals: { results: search.run }
end
