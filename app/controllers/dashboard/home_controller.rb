class Dashboard::HomeController < Dashboard::ApplicationController
  def index

    twitter_search = TwitterSearch.new
    twitter_search.find_tweets(1)

    # users = User.all
    #
    # users.each do |user|
    #   twitter_search = TwitterSearch.new
    #   twitter_search.find_tweets(user.id)
    # end
  end
end
