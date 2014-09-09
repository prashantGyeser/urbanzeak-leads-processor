class AddLeadStreamIdToUnprocessedLeads < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :lead_stream_id, :integer
  end
end
