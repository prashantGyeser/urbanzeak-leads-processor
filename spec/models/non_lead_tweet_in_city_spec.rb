# == Schema Information
#
# Table name: non_lead_tweet_in_cities
#
#  id                       :integer          not null, primary key
#  tweet_poster_screen_name :string(255)
#  tweet_user_image         :string(255)
#  tweet_body               :text
#  user_location            :string(255)
#  gnip_matching_rules      :text
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#  city_latlon_generate_for :string(255)
#  tweet_id                 :string(255)
#  delivered_at             :datetime
#  followers_count          :integer
#  friends_count            :integer
#  datasift_stream_hash     :string(255)
#  subscription_id          :string(255)
#  klout_score              :integer
#

require 'rails_helper'

RSpec.describe NonLeadTweetInCity, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
