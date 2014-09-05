class CreateDatasiftSubscriptions < ActiveRecord::Migration
  def change
    create_table :datasift_subscriptions do |t|
      t.string :datasift_subscription_id
      t.string :stream_hash
      t.string :subscription_name
      t.text :query

      t.timestamps
    end
  end
end
