# == Schema Information
#
# Table name: unprocessed_leads
#
#  id                       :integer          not null, primary key
#  tweet_poster_screen_name :string(255)
#  tweet_user_image         :string(255)
#  tweet_body               :text
#  user_location            :string(255)
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
#  lead_stream_id           :integer
#  category_id              :integer
#  city_id                  :integer
#

# Todo: Add columns for follower count, status count and

class UnprocessedLead < ActiveRecord::Base
  belongs_to :user
end
