# == Schema Information
#
# Table name: unique_lead_streams
#
#  id          :integer          not null, primary key
#  city_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unique_lead_stream do
    city_id 1
    category_id 1
  end
end
