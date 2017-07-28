ENV["SINATRA_ENV"] ||= 'development'

require 'bundler'
require 'sinatra/activerecord'
require 'sinatra/contrib'
Bundler.require(:default, ENV["SINATRA_ENV"])

register Sinatra::Contrib

connection_details = YAML::load(File.open('config/database.yml'))[ENV["SINATRA_ENV"]]
ActiveRecord::Base.establish_connection(connection_details)

require_all 'app'
