require 'datasift_calls'
require 'rails_helper'

RSpec.describe DatasiftCalls do

  it "validate a given csdl query" do
    sample_query = 'twitter.text contains_any "beer"'
    datasift_calls = DatasiftCalls.new
    expect(datasift_calls.valid_csdl?(sample_query)).to eq true
  end

end