class AddSubscriptionIdToUnprocessedLeads < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :subscription_id, :string
    add_column :unprocessed_leads, :klout_score, :integer
  end
end
