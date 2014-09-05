# == Schema Information
#
# Table name: deleted_datasift_subscriptions
#
#  id                       :integer          not null, primary key
#  datasift_subscription_id :string(255)
#  stream_hash              :string(255)
#  subscription_name        :string(255)
#  query                    :text
#  created_at               :datetime
#  updated_at               :datetime
#

class DeletedDatasiftSubscription < ActiveRecord::Base
end
