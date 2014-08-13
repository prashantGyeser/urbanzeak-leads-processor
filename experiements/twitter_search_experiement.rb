require 'twitter'
require 'pp'

# Client initialization
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "P1akA2LS1B6VHWiPzfyhDh24u"
  config.consumer_secret     = "eOuMGTiqXkqalOdGxYdxZiCGL73H5mc43LlswxHsfW3FRIqRoj"
  config.access_token        = "2431831016-Tps58cf93MX9uW0n1GX6zXTNzrsYgOj9BIwJoDu"
  config.access_token_secret = "W4mKPVbHybmYgumLzN7RFrCwTyLJoI1I0TIGr5ubsu3Rl"
end


# client.search("sushi", :result_type => "recent").collect do |tweet|
#   puts tweet.inspect
# end
#

client.search("sushi OR food", geocode: "40.790434,-73.305140,25mi" ).collect do |tweet|

  tweet_hash = {}

  #pp tweet.to_h

  tweet_hash[:tweet_poster_screen_name] = tweet.user.screen_name
  tweet_hash[:tweet_body] = tweet.text
  if tweet.user.location.to_s.empty?
    tweet_hash[:user_location] = ''
  else
    tweet_hash[:user_location] = tweet.user.location
  end

  tweet_hash[:city_latlon_generate_for] = "NYC"

  pp tweet_hash

  puts ""
  puts ""
  puts ""
  puts ""

  #puts "#{tweet.user.screen_name}: #{tweet.text}"

end
#puts client.search("sushi"} ).inspect