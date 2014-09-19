class AddCategoryIdToUnprocessedLeads < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :category_id, :integer
    add_column :unprocessed_leads, :city_id, :integer
  end
end
