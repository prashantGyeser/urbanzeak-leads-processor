class SearchCaller

  users = User.all

  users.each do |user|
    twitter_search = TwitterSearch.new
    twitter_search.delay.find_tweets(user.id)
  end

end