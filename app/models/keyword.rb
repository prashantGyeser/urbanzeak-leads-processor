# == Schema Information
#
# Table name: keywords
#
#  id          :integer          not null, primary key
#  word        :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Keyword < ActiveRecord::Base
  belongs_to :category
end
