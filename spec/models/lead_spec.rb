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
#

require 'rails_helper'

RSpec.describe Lead, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
