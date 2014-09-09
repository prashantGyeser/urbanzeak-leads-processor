class AddCategoryToDatasiftSubscriptions < ActiveRecord::Migration
  def change
    add_column :datasift_subscriptions, :category_id, :integer
    add_column :datasift_subscriptions, :city_id, :integer
  end
end
