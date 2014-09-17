# == Schema Information
#
# Table name: deleted_tweets
#
#  id          :integer          not null, primary key
#  tweet_id    :string(255)
#  screen_name :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe DeletedTweet, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
