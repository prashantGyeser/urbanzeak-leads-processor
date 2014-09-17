class AddCategoryIdToDeletedDatasiftSubscriptions < ActiveRecord::Migration
  def change
    add_column :deleted_datasift_subscriptions, :category_id, :integer
    add_column :deleted_datasift_subscriptions, :city_id, :integer
  end
end
