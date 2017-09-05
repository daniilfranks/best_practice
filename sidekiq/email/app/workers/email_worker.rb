require_relative '../../config/environment.rb'

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

class SmsWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform(title, email, price)
    url    = 'https://sms.ru/sms/send'
    api_id = '4E629201-A6AE-C157-5D5F-DD517D182A81'
    to     = '79503206396'
    msg    = "#{title}, #{email}, #{price}"
    json   = '1'

    uri = URI.parse(url)
    params = { api_id: api_id, to: to, msg: msg, json: json }
    Net::HTTP.post_form(uri, params)
  end
end
