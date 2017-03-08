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
  :body => body,
  :via => :smtp,
  :via_options => {
    :address        => 'smtp.mailgun.org',
    :port           => '2525',
    :user_name      => 'postmaster*******',
    :password       => 'e1ede139f************',
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain         => "localhost.localdomain" # the  domain provided by the client to the server
  }
})

"success"
