ENV["SINATRA_ENV"] ||= 'development'

require 'bundler'
require 'sinatra/activerecord'
Bundler.require(:default, ENV["SINATRA_ENV"])

#Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each { |f| require f }

connection_details = YAML::load(File.open('config/database.yml'))[ENV["SINATRA_ENV"]]
ActiveRecord::Base.establish_connection(connection_details)

require_all 'app'
