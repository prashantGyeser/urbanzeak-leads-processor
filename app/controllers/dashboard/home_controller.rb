class Dashboard::HomeController < Dashboard::ApplicationController
  def index
    twitter_search = TwitterSearch.new
    twitter_search.find_tweets
  end
end
