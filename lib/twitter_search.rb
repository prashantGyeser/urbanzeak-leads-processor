class TwitterSearch

  def find_tweets(user_id)

    oauth_token = OauthToken.find_by_user_id(user_id)

    # Client initialization
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "P1akA2LS1B6VHWiPzfyhDh24u"
      config.consumer_secret     = "eOuMGTiqXkqalOdGxYdxZiCGL73H5mc43LlswxHsfW3FRIqRoj"
      config.access_token        = oauth_token.oauth_token
      config.access_token_secret = oauth_token.oauth_secret
    end

    search_string = keywords_array.join(" OR ")
    city = City.find(city_id)

    client.search(search_string, geocode: "#{city.latitude},#{city.longitude},25mi" ).collect do |tweet|

      tweet_hash = {}
      tweet_hash[:tweet_id] = tweet.id
      tweet_hash[:tweet_poster_screen_name] = tweet.user.screen_name
      tweet_hash[:tweet_body] = tweet.text
      if tweet.user.location.to_s.empty?
        tweet_hash[:user_location] = ''
      else
        tweet_hash[:user_location] = tweet.user.location
      end
      tweet_hash[:city_latlon_generate_for] = city.city_name
      tweet_hash[:user_id] = user_id

      UnprocessedLead.create(tweet_hash)

    end

  end


end

#City.create(city_name:"New York", city_code:"NYC", latitude: 40.790434, longitude:-73.305140)
