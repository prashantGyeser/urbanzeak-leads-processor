
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
#

require 'faker'

FactoryGirl.define do
  factory :unprocessed_lead do
    tweet_poster_screen_name  Faker::Internet.user_name('Nancy Johnson', %w(. _ -))
    tweet_body                Faker::Lorem.characters(110)
    user_location             Faker::Address.city
    tweet_id                  Faker::Lorem.characters(10)
    delivered_at              Date.today
    followers_count           Faker::Number.number(2)
    friends_count             Faker::Number.number(2)
    klout_score               Faker::Number.number(2)
  end
end
