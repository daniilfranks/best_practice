ENV["SINATRA_ENV"] ||= 'development'

require 'bundler'
require 'sinatra/activerecord'
Bundler.require(:default, ENV["SINATRA_ENV"])

connection_details = YAML::load(File.open('config/database.yml'))[ENV["SINATRA_ENV"]]
ActiveRecord::Base.establish_connection(connection_details)

require_all 'app'
