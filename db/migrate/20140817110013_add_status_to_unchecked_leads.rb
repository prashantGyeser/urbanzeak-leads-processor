class AddStatusToUncheckedLeads < ActiveRecord::Migration
  def change
    add_column :unchecked_leads, :status, :boolean
  end
end
