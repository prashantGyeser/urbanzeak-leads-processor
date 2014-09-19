require 'datasift_query'
require 'rails_helper'

RSpec.describe DatasiftQuery do

  it "should return a valid datasift query given valid keywords and city" do
    keywords = 'beer, shots, party, cocktails'

    result = DatasiftQuery.get_query_for_keywords(keywords)

    expect(result).to eq "( twitter.text contains_any \"beer\" OR twitter.text contains_any \"shots\" OR twitter.text contains_any \"party\" OR twitter.text contains_any \"cocktails\" )"
  end

  it "should return a valid datasift location query given a valid city" do
    city = "Chicago"

    expect(DatasiftQuery.get_query_for_city(city)).to eq "( twitter.user.location contains_any \"Chicago\" OR twitter.place.full_name contains_any \"Chicago\" OR twitter.geo geo_radius \"41.8781136,-87.6297982:20\" )"

  end


  it "should return a valid latitude longitude given a valid city" do
    city = "Chicago"
    results = DatasiftQuery.get_lat_lon_for_city(city)
    expect(results).to eq [41.8781136, -87.6297982]
  end

  it "should return a valid lat long given a city with two possible places" do
    city = "nashville"
    results = DatasiftQuery.get_lat_lon_for_city(city)
    expect(results).to eq [36.166667, -86.783333]
  end

  it "should generate a valid csdl given a valid city and valid keywords" do
    keywords = 'beer, shots, party, cocktails'
    city = "Chicago"

    keyword_query = DatasiftQuery.get_query_for_keywords(keywords)
    city_query = DatasiftQuery.get_query_for_city(city)

    datasift_query = DatasiftQuery.new
    query = datasift_query.generate(keywords, city)

    expect(query).to eq keyword_query + ' AND ' + city_query

  end


end