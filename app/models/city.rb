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
  validates :city_name, :uniqueness => true
  belongs_to :user
end
