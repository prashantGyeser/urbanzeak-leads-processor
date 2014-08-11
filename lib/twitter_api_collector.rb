require 'tweetstream'

class TwitterApiCollector

  # TweetStream.configure do |config|
  #   config.consumer_key       = '9fiOa2gB2AagQsUlq7ERTjc5H'
  #   config.consumer_secret    = 'IL9w4UtGcQaij5lUf8vAjkGHEBCG0UnTIzX2vaDiIJRhzvTgfM'
  #   config.oauth_token        = '132980832-ib95N4jIqrHTLxICG1u3qJqwLGSc0XD0vSNl8kQJ'
  #   config.oauth_token_secret = 'aAlX3vKFL7Us23DvOg6OOSg8MgkTDVFKUfvOh5AE8XAbE'
  #   config.auth_method        = :oauth
  # end

  def collect_tweets(user_id, keywords_array)
    twitter_oauth_key = TwitterOauthKey.find_by_user_id(user_id)
    user = User.find(user_id)

    puts "Initializing the collection stream"

    TweetStream.configure do |config|
      config.consumer_key       = twitter_oauth_key.consumer_key
      config.consumer_secret    = twitter_oauth_key.consumer_secret
      config.oauth_token        = twitter_oauth_key.oauth_token
      config.oauth_token_secret = twitter_oauth_key.oauth_token_secret
      config.auth_method        = :oauth
    end

    client = TweetStream::Client.new

    client.on_error do |message|
      #logger.error "Error: #{message.join("\n")}"

      Honeybadger.notify(
          :error_class   => "Tweetstream Error",
          :error_message => "Tweetstream Error: #{message}"
#          :parameters    => params
      )

    end

    client.on_reconnect do |message|
      #logger.info "Reconnecting: #{message.join("\n")}"

      Honeybadger.notify(
          :error_class   => "Tweetstream Reconnecting",
          :error_message => "Tweetstream Reconnecting: #{message}"
#          :parameters    => params
      )

    end

    client.on_limit do |skip_count|
      #logger.info "Skipped: #{skip_count.join("\n")}"

      Honeybadger.notify(
          :error_class   => "Tweetstream Skipcount",
          :error_message => "Tweetstream Skipcount: #{skip_count}"
#          :parameters    => params
      )

    end

# Tracking the following tweets
    client.track(keywords_array) do |tweet|
      puts "The keywords are: #{keywords_array.inspect}"
      puts "Storing tweet..."

      parse_start_time = Time.now
      tweet_hash = TwitterApiDataParser.parse_tweet_stream_data(tweet, user_id)
      parse_end_time = Time.now

      puts "The hash returened is: #{tweet_hash.inspect}"
      puts "The time to parse the input tweets is: #{parse_end_time - parse_start_time}"

      UnprocessedLead.create(tweet_hash)


    end

  end

end