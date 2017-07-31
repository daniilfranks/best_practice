ENV["SINATRA_ENV"] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV["SINATRA_ENV"])
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require 'rack-flash'
require 'rack/csrf'

connection_details = YAML::load(File.open('config/database.yml'))[ENV["SINATRA_ENV"]]
ActiveRecord::Base.establish_connection(connection_details)

require_all 'app'

# http://localhost:3000/posts?post[title]=Mypost&post[description]=text&post[user_id]=1