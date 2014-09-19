class AddCategoryIdToDashboardTwitterSearches < ActiveRecord::Migration
  def change
    add_column :dashboard_twitter_searches, :category_id, :integer
    add_column :dashboard_twitter_searches, :city_id, :integer
  end
end
