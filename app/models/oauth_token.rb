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

class OauthToken < ActiveRecord::Base
end
