class AddDatasiftStreamHashToUnprocessedLeads < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :datasift_stream_hash, :string
  end
end
