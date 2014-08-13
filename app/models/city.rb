# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city_name  :string(255)
#  city_code  :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#  user_id    :string(255)
#

class City < ActiveRecord::Base
  belongs_to :user
end
