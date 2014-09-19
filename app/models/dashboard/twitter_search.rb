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

class Dashboard::TwitterSearch < ActiveRecord::Base
end
