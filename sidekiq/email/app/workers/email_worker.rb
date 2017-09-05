require 'sidekiq'
require 'sendgrid-ruby'
include SendGrid

Sidekiq.configure_client do |config|
  config.redis = { :host => "127.0.0.1", :port => 6379, :db => 15, :password => 12345 }
end

Sidekiq.configure_server do |config|
  config.redis = { :host => "127.0.0.1", :port => 6379, :db => 15, :password => 12345 }
end

class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform(title, email, price)
    from = Email.new(email: 'admin@danilababanov.ovh')
	to = Email.new(email: email)
	subject = title
	content = Content.new(type: 'text/plain', value: "You book create. Title: #{title}, Price: #{price}")
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
