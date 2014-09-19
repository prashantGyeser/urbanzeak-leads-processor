# == Schema Information
#
# Table name: dashboard_twitter_searches
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  keyword     :string(255)
#  city        :string(255)
#  category_id :integer
#  city_id     :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dashboard_twitter_search, :class => 'Dashboard::TwitterSearch' do
  end
end
