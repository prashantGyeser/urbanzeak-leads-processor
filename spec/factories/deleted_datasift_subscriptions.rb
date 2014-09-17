# == Schema Information
#
# Table name: deleted_datasift_subscriptions
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

FactoryGirl.define do
  factory :deleted_datasift_subscription do
    datasift_subscription_id "MyString"
    stream_hash "MyString"
    subscription_name "MyString"
    query "MyText"
  end
end
