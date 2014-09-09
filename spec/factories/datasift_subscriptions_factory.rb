# == Schema Information
#
# Table name: datasift_subscriptions
#
#  id                       :integer          not null, primary key
#  datasift_subscription_id :string(255)
#  stream_hash              :string(255)
#  subscription_name        :string(255)
#  query                    :text
#  created_at               :datetime
#  updated_at               :datetime
#  category_id              :integer
#  city_id                  :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :datasift_subscription do
    datasift_subscription_id Faker::Lorem.characters(10)
    stream_hash Faker::Lorem.characters(10)
    subscription_name Faker::Lorem.characters(10)
    query Faker::Lorem.characters(10)
  end
end
