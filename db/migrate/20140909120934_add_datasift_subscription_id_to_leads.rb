class AddDatasiftSubscriptionIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :datasift_subscription_id, :integer
  end
end
