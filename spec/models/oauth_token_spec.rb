# == Schema Information
#
# Table name: oauth_tokens
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  oauth_token  :string(255)
#  oauth_secret :string(255)
#  provider     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe OauthToken, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
