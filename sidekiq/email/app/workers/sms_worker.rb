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
