class AddDatasiftSubscriptionIdToUncheckedLeads < ActiveRecord::Migration
  def change
    add_column :unchecked_leads, :datasift_subscription_id, :integer
  end
end
