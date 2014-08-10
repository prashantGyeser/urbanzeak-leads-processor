# == Schema Information
#
# Table name: twitter_oauth_keys
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  consumer_key       :string(255)
#  consumer_secret    :string(255)
#  oauth_token        :string(255)
#  oauth_token_secret :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'rails_helper'

RSpec.describe TwitterOauthKey, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
