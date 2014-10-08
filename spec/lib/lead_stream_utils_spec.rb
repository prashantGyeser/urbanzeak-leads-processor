require 'lead_stream_utils'
require 'rails_helper'

RSpec.describe LeadStreamUtils do

  it "should return all the streams that do not have a datasift subscription" do

    create(:unique_lead_stream)

    lead_stream_utils = LeadStreamUtils.new

    results = lead_stream_utils.get_stream_without_subscription

    expect(results.count).to eq 1

  end


  it "should not return streams that already have a subscription" do

    unique_lead_stream = create(:unique_lead_stream)
    create(:datasift_subscription, city_id: unique_lead_stream.city_id, category_id: unique_lead_stream.category_id)

    lead_stream_utils = LeadStreamUtils.new

    results = lead_stream_utils.get_stream_without_subscription

    expect(results.count).to eq 0

  end

end