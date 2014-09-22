# == Schema Information
#
# Table name: word_counters
#
#  id         :integer          not null, primary key
#  word       :string(255)
#  tweet_body :string(255)
#  created_at :datetime
#  updated_at :datetime
#  tweet_type :string(255)
#

require 'rails_helper'

RSpec.describe WordCounter, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
