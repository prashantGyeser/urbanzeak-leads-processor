require 'datasift_query'
require 'rails_helper'

RSpec.describe DatasiftQuery do

  it "should return a valid datasift query given valid keywords and city" do
    keywords = 'beer, shots, party, cocktails'

    result = DatasiftQuery.get_query_for_keyword_match(keywords)

    expect(result).to eq "( twitter.text contains_any 'beer' OR twitter.text contains_any 'shots' OR twitter.text contains_any 'party' OR twitter.text contains_any 'cocktails' )"
  end

  it "should return a valid datasift location query given a valid city" do
    city = "Chicago"

    #expect(DatasiftQuery.get_query_for_city(city)).to eq "test"
  end


  it "shoudl return a valid latitude longitude given a valid city" do
    city = "Chicago"
    results = DatasiftQuery.get_lat_lon_for_city(city)
    expect(results).to eq [41.8781136, -87.6297982]

  end

end