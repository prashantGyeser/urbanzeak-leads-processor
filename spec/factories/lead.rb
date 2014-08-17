require 'faker'

FactoryGirl.define do
  factory :lead do
    tweet_poster_screen_name Faker::Internet.user_name(Faker::Name.name, %w(. _ -))
    user_id 1
  end
end
