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

require 'rails_helper'

RSpec.describe Keyword, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
