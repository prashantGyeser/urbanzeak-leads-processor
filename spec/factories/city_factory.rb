# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city_name  :string(255)
#  city_code  :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#  user_id    :string(255)
#

require 'faker'

FactoryGirl.define do
  factory :city do
    city_name Faker::Lorem.characters(10)
  end
end
