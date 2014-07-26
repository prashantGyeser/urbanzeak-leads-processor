# == Schema Information
#
# Table name: training_leads
#
#  id         :integer          not null, primary key
#  tweet_body :text
#  created_at :datetime
#  updated_at :datetime
#

class TrainingLead < ActiveRecord::Base
end
