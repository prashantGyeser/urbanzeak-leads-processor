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

require 'keyword_checker'

class Lead < ActiveRecord::Base

  def self.records_containing_word(word)
    lead_with_word_array = []
    Lead.find_each do |lead|
      if KeywordChecker.word_in_tweet?(lead.tweet_body, word)
        lead_with_word_array << lead
      end
    end
    return lead_with_word_array
  end



end
