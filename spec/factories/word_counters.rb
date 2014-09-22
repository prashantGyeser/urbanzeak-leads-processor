# == Schema Information
#
# Table name: word_counters
#
#  id         :integer          not null, primary key
#  word       :string(255)
#  tweet_body :string(255)
#  created_at :datetime
#  updated_at :datetime
#  tweet_type :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word_counter do
    word "MyString"
    tweet_body "MyString"
    type ""
  end
end
