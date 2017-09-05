require 'sinatra'
require 'rack'
require 'sidekiq'
require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = { :host => "127.0.0.1", :port => 6379, :db => 15, :password => 12345 }
end

run Sidekiq::Web

# rackup
# localhost:9292
