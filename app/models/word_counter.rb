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

class WordCounter < ActiveRecord::Base
end
