require 'rails_helper'
require 'keyword_checker'

RSpec.describe KeywordChecker do

  it "should return true when the tweet has the word" do

    tweet = "This is a tweet test"
    word_to_check = "test"

    expect(KeywordChecker.word_in_tweet?(tweet, word_to_check)).to eq true
  end

  it "should return false if there is a substring only and not the entire word" do

    tweet = "This is a tweettest"
    word_to_check = "test"

    expect(KeywordChecker.word_in_tweet?(tweet, word_to_check)).to eq false
  end

end