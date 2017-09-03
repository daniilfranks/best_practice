#"4E629201-A6AE-C157-5D5F-DD517D182A81+79503206396@sms.ru","","New zakaz!"

require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: 'admin@danilababanov.ovh')
to = Email.new(email: "4E629201-A6AE-C157-5D5F-DD517D182A81@sms.ru")
subject = '79503206396'
content = Content.new(type: 'text/plain', value: 'New zakaz!')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
