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
#

require 'rails_helper'

RSpec.describe NonLeadTweetInCity, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
