# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  city_id    :integer
#

require 'faker'

FactoryGirl.define do
  factory :user do
    email     Faker::Internet.email
  end
end
