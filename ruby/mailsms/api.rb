# gem install sendgrid-ruby

require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: 'admin@danilababanov.ovh')
to = Email.new(email: 'babanovs5@gmail.com')
subject = 'Hi boban'
content = Content.new(type: 'text/plain', value: 'My text')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers


# echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
# echo "sendgrid.env" >> .gitignore
# source ./sendgrid.env