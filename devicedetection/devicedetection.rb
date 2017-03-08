require 'device_detector'
require 'json'

#user_agent = 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36'
user_agent = request.env["HTTP_USER_AGENT"]

client = DeviceDetector.new(user_agent)

{"name" => client.name,
 "version" => client.full_version,
 "clientOS" => client.os_name,
 "clientOsVersion" => client.os_full_version,
 "clientDevice" => client.device_name,
 "clientDeviceType" => client.device_type}.to_json

=begin
 It returns below
{"name":"Chrome","version":'30.0.1599.69', "clientOS":"Apple", "clientOsVersion":"webkit", "clientDevice" : 'iPhone 5',
 "clientDeviceType":"smartphone"}
