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

require 'rails_helper'

RSpec.describe UserKeyword, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
