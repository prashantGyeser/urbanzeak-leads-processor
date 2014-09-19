require 'twitter_search'
require 'rails_helper'

describe TwitterSearch do

  it "should search and return tweets given a valid keyword and city" do

    category = Category.create(name: "Test")
    city = City.create(city_name: "New York")

    twitter_search = TwitterSearch.new
    results = twitter_search.admin_find_tweet_using_keyword_and_city("party", "New York", category.id, city.id)

    expect(results).to eq true

  end

end