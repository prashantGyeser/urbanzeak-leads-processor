class AddCategoryIdToUncheckedLeads < ActiveRecord::Migration
  def change
    add_column :unchecked_leads, :category_id, :integer
    add_column :unchecked_leads, :city_id, :integer
  end
end
