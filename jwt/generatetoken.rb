require 'jwt'
require 'json'

data = "somedata" # or params[:data]
pwd = "someeasypwd"

def payload data
{
 exp: Time.now.to_i + 5*60,
 iat: Time.now.to_i,
 iss: 'serverlessly',
 scopes: ['serverlesslyuser'],
 user: {
      data: data,
    }
}
end
JWT.encode payload(data), pwd, 'HS256'
