# sudo apt-get install libxml2-dev
# gem install twilio-ruby -v 5.2.2

require 'twilio-ruby'

to = '+79503206396'
from = '+13177903092'
body = 'Hello Den.'

ACCOUNT_SID = 'AC3c205c6809ff111aa3878580c8612b74'
AUTH_TOKEN = 'f44113fc5e3742cb493031594b7aaf47'
client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

client.api.account.messages.create(
  to: to,
  from: from,
  body: body
)
