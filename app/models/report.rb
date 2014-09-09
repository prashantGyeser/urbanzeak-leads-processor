# == Schema Information
#
# Table name: reports
#
#  id                       :integer          not null, primary key
#  total_tweets_for_day     :integer
#  lead_stream_id           :integer
#  created_at               :datetime
#  updated_at               :datetime
#  datasift_subscription_id :integer
#  date_collected           :datetime
#

class Report < ActiveRecord::Base
end
