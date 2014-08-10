require 'tweetstream'

class TwitterApiCollector

  # TweetStream.configure do |config|
  #   config.consumer_key       = '9fiOa2gB2AagQsUlq7ERTjc5H'
  #   config.consumer_secret    = 'IL9w4UtGcQaij5lUf8vAjkGHEBCG0UnTIzX2vaDiIJRhzvTgfM'
  #   config.oauth_token        = '132980832-ib95N4jIqrHTLxICG1u3qJqwLGSc0XD0vSNl8kQJ'
  #   config.oauth_token_secret = 'aAlX3vKFL7Us23DvOg6OOSg8MgkTDVFKUfvOh5AE8XAbE'
  #   config.auth_method        = :oauth
  # end

  def collect(consumer_key, consumer_secret, oauth_token, oauth_secret, keywords_array)

    TweetStream.configure do |config|
      config.consumer_key       = consumer_key
      config.consumer_secret    = consumer_secret
      config.oauth_token        = oauth_token
      config.oauth_token_secret = oauth_secret
      config.auth_method        = :oauth
    end

    client = TweetStream::Client.new

    client.on_error do |message|
      logger.error "Error: #{message.join("\n")}"
    end

    client.on_reconnect do |message|
      logger.info "Reconnecting: #{message.join("\n")}"
    end

    client.on_limit do |skip_count|
      logger.info "Skipped: #{skip_count.join("\n")}"
    end

# Tracking the following tweets
    client.track(keywords_array) do |tweet|
      puts "Storing tweet..."

      puts tweet.user.screen_name


    end

  end

end