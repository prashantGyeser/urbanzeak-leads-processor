require 'location_checker'


describe LocationChecker do

  it "should return true if a proper location is in the list" do
    location = "New York"
    expect(LocationChecker.preferred_location_available?(location)).to be true
  end

  it "should return true if a lower case location is in the list" do
    location = "new york"
    expect(LocationChecker.preferred_location_available?(location)).to be true
  end

  it "should return true if a substring matches an item in the preffered location list" do
    location = "nyc#dsf"
    expect(LocationChecker.preferred_location_available?(location)).to be true
  end

  it "should return true given a three words with a substring match" do
    location = "new york>balkans"
    expect(LocationChecker.preferred_location_available?(location)).to be true
  end

  it "should return false if the tweet location is not in the list" do
    location = "chennai"
    expect(LocationChecker.preferred_location_available?(location)).to be false
  end

  it "should return true if the tweet location contains a backslash" do
    location = "NJ/NY"
    expect(LocationChecker.preferred_location_available?(location)).to be true
  end


  # City check tests

  it "should return new york when given any place in new york" do
    hash_to_check = {}
    hash_to_check[:location] = "NYC"
    location_array = ["New York", "NYC"]
    # expect(PreProcessor.does_location_belong_to_this_city?(hash_to_check[:location], location_array)).to be true
  end

  it "should return false if a given location is not in the current locations check list" do
    hash_to_check = {}
    hash_to_check[:location] = "Glendale"
    location_array = ["New York", "NYC"]
    # expect(PreProcessor.does_location_belong_to_this_city?(hash_to_check[:location], location_array)).to be false
  end

  # Category keywords check

  it "should return true if the tweet string contains a keyword from the category keyword list" do
    tweet_body = "I LUV ramen"
    category_keyword_list = ["sushi", "ramen"]
    # expect(PreProcessor.does_tweet_contain_category_keywords?(tweet_body, category_keyword_list)).to be true
  end

  it "should return true when the word matched have different cases" do
    tweet_body = "I LUV RAmen"
    category_keyword_list = ["sushi", "ramen"]
    # expect(PreProcessor.does_tweet_contain_category_keywords?(tweet_body, category_keyword_list)).to be true
  end

end