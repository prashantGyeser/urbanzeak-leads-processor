class AddDatasiftSubscriptionIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :datasift_subscription_id, :integer
  end
end
