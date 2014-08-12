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


end