require 'datasift_calls'
require 'rails_helper'

RSpec.describe DatasiftCalls do

  it "validate a given csdl query" do
    sample_query = 'twitter.text contains_any "beer"'
    datasift_calls = DatasiftCalls.new
    expect(datasift_calls.valid_csdl?(sample_query)).to eq true
  end

  it "should return a invalid when given a query with double quotes contains the query" do
    sample_query = "( twitter.text contains_any 'beer' OR twitter.text contains_any 'shots' OR twitter.text contains_any 'party' OR twitter.text contains_any 'cocktails' ) AND ( twitter.user.location contains_any 'Chicago' OR twitter.place.full_name contains_any  'Chicago' OR twitter.geo geo_radius '41.89,-87.72:33' )"
    datasift_calls = DatasiftCalls.new
    expect(datasift_calls.valid_csdl?(sample_query)).to eq true
  end


end