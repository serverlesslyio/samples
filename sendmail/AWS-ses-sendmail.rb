gem 'pony'
gem 'json'

require 'json'
require 'pony'

toemail =  "acb***@gmail.com"
fromemail =  "acb**@yourdomain.com"
body = "Hi,<br/> This body and intro line. <br/> Wassup hows it going? <br/><br/>Best<br/>-Mark"
subject =  "Single line subject line is good"

Pony.mail({
  :to => toemail,
  :from => fromemail,
  :subject => subject,
  :html_body => body,
  :via => :smtp,
  :via_options => {
    :address        => 'email-smtp.us-west-2.amazonaws.com',
    :port           => '2587',
    :user_name      => 'AKI***',
    :password       => 'AhB***',
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain         => "yourdomain.com" # the domain provided by the client to the server
  }
})
