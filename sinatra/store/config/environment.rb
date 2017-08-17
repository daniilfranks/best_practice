ENV["SINATRA_ENV"] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV["SINATRA_ENV"])
require 'sinatra/activerecord'
require 'rack-flash'

connection_details = YAML::load(File.open('config/database.yml'))[ENV["SINATRA_ENV"]]
ActiveRecord::Base.establish_connection(connection_details)

require_all 'app'
