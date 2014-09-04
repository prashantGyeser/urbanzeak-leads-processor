class AddDatasiftSubscriptionHashToUnprocessedLeads < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :datasift_subscription_hash, :string
    add_column :unprocessed_leads, :delivered_at, :datetime
    add_column :unprocessed_leads, :followers_count, :integer
    add_column :unprocessed_leads, :friends_count, :integer
  end
end
