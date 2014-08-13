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

require 'rails_helper'

RSpec.describe City, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
