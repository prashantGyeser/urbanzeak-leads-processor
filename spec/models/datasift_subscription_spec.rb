# == Schema Information
#
# Table name: datasift_subscriptions
#
#  id                       :integer          not null, primary key
#  datasift_subscription_id :string(255)
#  stream_hash              :string(255)
#  subscription_name        :string(255)
#  query                    :text
#  created_at               :datetime
#  updated_at               :datetime
#  category_id              :integer
#  city_id                  :integer
#

require 'rails_helper'

RSpec.describe DatasiftSubscription, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
