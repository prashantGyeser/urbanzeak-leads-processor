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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    total_tweets_for_day 1
    date_collected "2014-09-08"
    lead_stream_id 1
  end
end
