require 'twilio-ruby'

#When you register with twilio you get account_sid and auth_token, Also you get private number

phonenumber = "+19******"
account_sid = 'AC*****'
auth_token = '5d****'

Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

client = Twilio::REST::Client.new

# any to number, also you can pass as parameter  params[:tonumber]
client.messages.create(from: phonenumber, to: '+18622878740', body: 'Hye tere')
