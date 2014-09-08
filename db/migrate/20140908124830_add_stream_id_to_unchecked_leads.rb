class AddStreamIdToUncheckedLeads < ActiveRecord::Migration
  def change
    add_column :unchecked_leads, :delivered_at, :datetime
    add_column :unchecked_leads, :followers_count, :integer
    add_column :unchecked_leads, :friends_count, :integer
    add_column :unchecked_leads, :datasift_stream_hash, :string
    add_column :unchecked_leads, :subscription_id, :string
    add_column :unchecked_leads, :klout_score, :integer
  end
end
