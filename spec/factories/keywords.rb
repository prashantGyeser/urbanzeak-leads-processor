# == Schema Information
#
# Table name: keywords
#
#  id          :integer          not null, primary key
#  word        :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keyword do
    word "MyString"
    category_id 1
  end
end
