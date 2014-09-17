# == Schema Information
#
# Table name: deleted_tweets
#
#  id          :integer          not null, primary key
#  tweet_id    :string(255)
#  screen_name :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deleted_tweet do
    tweet_id "MyString"
    screen_name "MyString"
  end
end
