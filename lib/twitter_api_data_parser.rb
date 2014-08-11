class TwitterApiDataParser

  def self.parse_tweet_stream_data(tweet_object, user_id)
    puts "It is getting into the parser....."

    tweet_hash = {}

    tweet_hash[:tweet_poster_screen_name] = tweet_object.user.screen_name
    tweet_hash[:tweet_body] = tweet_object.text
    tweet_hash[:user_location] = tweet_object.user.location
    tweet_hash[:user_id] = user_id

    puts "It is getting out of the parser....."
    return tweet_hash


  end

end