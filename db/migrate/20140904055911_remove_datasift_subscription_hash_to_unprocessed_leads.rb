class RemoveDatasiftSubscriptionHashToUnprocessedLeads < ActiveRecord::Migration
  def change
    remove_column :unprocessed_leads, :datasift_subscription_hash, :string
  end
end
