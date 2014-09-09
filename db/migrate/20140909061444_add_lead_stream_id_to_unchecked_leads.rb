class AddLeadStreamIdToUncheckedLeads < ActiveRecord::Migration
  def change
    add_column :unchecked_leads, :lead_stream_id, :integer
  end
end
