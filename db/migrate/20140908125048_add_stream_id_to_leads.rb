class AddStreamIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :delivered_at, :datetime
    add_column :leads, :followers_count, :integer
    add_column :leads, :friends_count, :integer
    add_column :leads, :datasift_stream_hash, :string
    add_column :leads, :subscription_id, :string
    add_column :leads, :klout_score, :integer
  end
end
