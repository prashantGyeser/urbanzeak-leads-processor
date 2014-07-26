# == Schema Information
#
# Table name: unprocessed_leads
#
#  id                         :integer          not null, primary key
#  tweet_id                   :string(255)
#  tweet_poster_user_id       :string(255)
#  tweet_poster_screen_name   :string(255)
#  tweet_poster_profile_link  :string(255)
#  tweet_poster_display_name  :string(255)
#  tweet_user_image           :string(255)
#  tweet_user_summary         :text
#  tweet_user_friends_count   :integer
#  tweet_user_followers_count :integer
#  tweet_post_time            :datetime
#  tweet_body                 :text
#  user_location              :string(255)
#  user_location_country_code :string(255)
#  gnip_matching_rules        :text
#  processed                  :boolean
#  created_at                 :datetime
#  updated_at                 :datetime
#

class UnprocessedLead < ActiveRecord::Base
end
