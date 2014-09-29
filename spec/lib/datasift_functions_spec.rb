require 'datasift_functions'
require 'rails_helper'
require 'spec_helper'

RSpec.describe DatasiftFunctions do

  it "should delete all the subscriptions currently on datasift" do
    #expect(DatasiftFunctions.delete_all_subscriptions_on_datasift).to eq true
  end

  it "should parse and store a returned object" do
    datasift_functions = DatasiftFunctions.new
    results = datasift_functions.create_subscriptions_for_stream_without_subscription
    first_subscription = results[:data][:subscriptions][0]
    expect(first_subscription[:id]).to eq "a022d39252879c43fedbb8d7aa1ab9e0"
  end

end