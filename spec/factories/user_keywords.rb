# == Schema Information
#
# Table name: user_keywords
#
#  id           :integer          not null, primary key
#  keyword_id   :integer
#  user_id      :integer
#  last_queried :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_keyword do
    keyword_id 1
    user_id 1
    last_queried "2014-08-30 04:16:04"
  end
end
