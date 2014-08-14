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

class User < ActiveRecord::Base
  has_many :unprocessed_leads
  has_many :user_cities
  has_many :user_categories
end
