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
#

class DatasiftSubscription < ActiveRecord::Base
  validates_presence_of :stream_hash, :subscription_name
end
