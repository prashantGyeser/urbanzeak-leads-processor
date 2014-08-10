class TwitterApiDataParser

  def self.parse_tweet_stream_data(tweet_object)
    tweet_hash = {}

    tweet_hash[:twitter_user_screen_name] = tweet.user.screen_name
    tweet_hash[:twitter_user_image_url] = (tweet.user.profile_image_url || '')
    tweet_hash[:tweet_text] = tweet.text
    tweet_hash[:twitter_user_location] = (tweet.user.location || '')

    return tweet_hash


  end

end