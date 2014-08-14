# == Schema Information
#
# Table name: user_cities
#
#  id         :integer          not null, primary key
#  city_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserCity < ActiveRecord::Base
  belongs_to :user
end
