# gem install sidekiq
require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { :host => "127.0.0.1", :port => 6379, :db => 15, :password => 12345 }
end

#Sidekiq.configure_server do |config|
#  config.redis = { :host => "127.0.0.1", :port => 6379, :db => 15, :password => 12345 }
#end

class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform(name, count = 1)
  	sleep count
    puts 'Doing hard work'
  end
end

#HardWorker.perform_async('Den', 25)
#HardWorker.perform_async('Mark', 15)
#HardWorker.perform_async('Leo', 45)
HardWorker.perform_async('Jok', 15)


# sidekiq -r ./sidekiq.rb

# pry -r ./sidekiq.rb
# HardWorker.perform_async('Den', 5)
# HardWorker.perform_async('Den', 6)
# HardWorker.perform_async('Den', 7)

# ps ax|grep sidekiq
# kill -TTIN 15392
# kill -USRI 15392
# kill -TERM 15392
