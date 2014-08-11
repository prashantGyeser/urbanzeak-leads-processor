class TweetCollector

  include Sidekiq::Worker

  def perform(user_id)
    keywords = ['Dumplings', 'Dimsum', 'Fried Rice', 'Thai food']
    twitter_api_collector = TwitterApiCollector.new
    twitter_api_collector.collect_tweets(user_id, keywords)
  end

end
