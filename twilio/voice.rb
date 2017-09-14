require 'twilio-ruby'
#https://www.twilio.com/console/voice/settings/geo-permissions

account_sid = 'AC3c205c6809ff111aa3878580c8612b74'
auth_token = 'f44113fc5e3742cb493031594b7aaf47'
client = Twilio::REST::Client.new(account_sid, auth_token)


client.api.account.calls.create(
  :from => '+13177903092',
  :to => '+79503206396',
  :url => "http://demo.twilio.com/docs/voice.xml"
)
