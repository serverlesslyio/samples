# Log mail click to firebase and redirect
gem 'firebase'

require 'firebase'

mailid = params[:id]
httprequesttype = request.env["REQUEST_METHOD"]
useragent = request.env["HTTP_USER_AGENT"]
log = {:mailid => mailid, :clickurl => params[:url], :ipaddress => "", :time => Time.now, :httprequest => httprequesttype, :useragent => useragent, :location => "", :ipinfo => ""}
base_uri = 'https://yourfirebaseurl.firebaseio.com/'
firebase = Firebase::Client.new(base_uri)
time = -Time.now.to_i
firebase.set("mailclicklogs/#{time}", log)

redirect params[:url]
