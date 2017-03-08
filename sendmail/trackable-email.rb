gem 'json'
gem 'pony'
gem 'twitter-text'

require 'twitter-text'
require 'json'
require 'pony'

toemail =  "acb***@gmail.com"
fromemail =  "acb**@yourdomain.com"
body = "Hi,<br/> This body and intro line. <br/> Wassup hows it going? check this out https://serverlessly.io <br/><br/>Best<br/>-Mark"
subject =  "Single line subject line is good"
mailid = Time.now

# replace urls in the body with
Twitter::Extractor.extract_urls(body).each do |url|
  if url.include?("http") || url.include?("https")
    body.gsub!(k, "<a href=\"https://serverlessly.io/trackmailclicks?id=#{mailid}&url=#{url}\">#{url}</a>")
  end

  if !k.include?("http") && !k.include?("https")
    body.gsub!(k, "<a href=\"https://serverlessly.io/trackmailclicks?id=#{mailid}&url=http://#{url}\">#{url}</a>")
  end
end

trackemailopen_body = body+"<img src=\"https://serverlessly.io/trackmailopens?id=#{mailid}\"  width=\"0\" height=\"0\" style=\"display: none;\" >"

Pony.mail({
  :to => toemail,
  :from => fromemail,
  :subject => subject,
  :html_body => trackemailopen_body,
  :via => :smtp,
  :via_options => {
    :address        => 'email-smtp.us-west-2.amazonaws.com',
    :port           => '2587',
    :user_name      => 'AKI****',
    :password       => 'AhB****',
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain         => "yourdomain.com" # the HELO domain provided by the client to the server
  }
  })
