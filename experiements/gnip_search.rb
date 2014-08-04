require 'net/http'
require 'uri'
require 'active_support'
require "active_support/core_ext"

# Example gnip search request
# curl -v --compressed -uprashant@urbanzeak.com \
#    "https://search.gnip.com/accounts/Urbanzeak/search/prod.json" -X POST \
#    -d '{"query":"gnip","publisher":"twitter","maxResults":10}'

gnip_search_url = 'https://search.gnip.com/accounts/Urbanzeak/search/prod.json'
username = 'prashant@urbanzeak.com'
password = 'KHELDAR@123'


payload = {:query => 'from:718_Kidd0', :publisher => 'twitter'}


uri = URI.parse(gnip_search_url)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER
http.ssl_version = :SSLv3
#http.ca_file = "equifax_ca.crt"
request = Net::HTTP::Post.new(uri.request_uri,initheader = {'Content-Type' =>'application/json'})
request.body = payload.to_json #payload is defined earlier as a hash with key/value pair
request.basic_auth username, password
response = http.request(request)
puts response.body