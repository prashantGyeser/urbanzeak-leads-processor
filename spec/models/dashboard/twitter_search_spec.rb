# == Schema Information
#
# Table name: dashboard_twitter_searches
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  keyword     :string(255)
#  city        :string(255)
#  category_id :integer
#  city_id     :integer
#

require 'rails_helper'

RSpec.describe Dashboard::TwitterSearch, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
