# == Schema Information
#
# Table name: leads
#
#  id                        :integer          not null, primary key
#  tweet_poster_screen_name  :string(255)
#  tweet_poster_profile_link :string(255)
#  tweet_user_image          :string(255)
#  tweet_body                :text
#  user_location             :string(255)
#  gnip_matching_rules       :text
#  created_at                :datetime
#  updated_at                :datetime
#  user_id                   :integer
#  city_latlon_generate_for  :string(255)
#  tweet_id                  :string(255)
#  sent                      :boolean
#  delivered_at              :datetime
#  followers_count           :integer
#  friends_count             :integer
#  datasift_stream_hash      :string(255)
#  subscription_id           :string(255)
#  klout_score               :integer
#  lead_stream_id            :integer
#  datasift_subscription_id  :integer
#  category_id               :integer
#  city_id                   :integer
#

require 'rails_helper'

RSpec.describe Lead, :type => :model do

  it "should return an array containing the hashes of all the leads with the word" do
    lead = create(:lead, :tweet_body => "This is a test")
    lead_2 = create(:lead, :tweet_body => "This is another test")
    results = Lead.records_containing_word("test")
    expect(results[0].id).to eq lead.id
    expect(results.count).to eq 2
  end

  it "should return a lead only if it contains a perfect match" do
    lead = create(:lead, tweet_body: "@TheBacklogGamer But again, this wasn't some random unbiased third party.  This was people out to ruin them bothering them for answers")
    results = Lead.records_containing_word("test")
    expect(results.count).to eq 0
  end

  it "should return a lead even if the cases of the words do not match" do
    lead = create(:lead, tweet_body: "@TheBacklogGamer But again, this wasn't some random unbiased third party.  This was people out to ruin them bothering them for answers")
    results = Lead.records_containing_word("but")
    expect(results[0].id).to eq lead.id
  end


end
