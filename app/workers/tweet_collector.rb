class TweetCollector

  include Sidekiq::Worker

  def perform(twitter_oauth_key_id)
    twitter_oauth_key = TwitterOauthKey.find(twitter_oauth_key_id)
    puts twitter_oauth_key.user_id
  end

end