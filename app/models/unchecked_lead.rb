# == Schema Information
#
# Table name: unchecked_leads
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

class UncheckedLead < ActiveRecord::Base
end
