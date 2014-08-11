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
#

class UnprocessedLead < ActiveRecord::Base
end
