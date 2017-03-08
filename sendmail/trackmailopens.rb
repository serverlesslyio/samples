# Log mail opens to firebase
gem 'firebase'

require 'firebase'

mailid = params[:id]
httprequesttype = request.env["REQUEST_METHOD"]
useragent = request.env["HTTP_USER_AGENT"]
log = {:mailid => mailid, :ipaddress => "", :time => Time.now, :httprequest => httprequesttype, :useragent => useragent, :location => "", :ipinfo => ""}
base_uri = 'https://yourfirebaseurl.firebaseio.com/'
firebase = Firebase::Client.new(base_uri)
time = -Time.now.to_i
firebase.set("mailopenlogs/#{time}", log)
