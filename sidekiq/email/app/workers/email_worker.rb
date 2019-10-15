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

  def on_status(status, book_id)
    
  end
end
