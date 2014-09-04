# == Schema Information
#
# Table name: user_keywords
#
#  id           :integer          not null, primary key
#  keyword_id   :integer
#  user_id      :integer
#  last_queried :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class UserKeyword < ActiveRecord::Base
end
