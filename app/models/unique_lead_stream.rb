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

class UniqueLeadStream < ActiveRecord::Base
  validates_uniqueness_of :city_id, scope: :category_id
end
