class AddUserIdToUnprocessedLead < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :user_id, :integer
  end
end
