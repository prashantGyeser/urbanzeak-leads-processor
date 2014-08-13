class ChangeTweetIdFormatInUnprocessedLeads < ActiveRecord::Migration
  def change
    change_column(:unprocessed_leads, :tweet_id, :float)
  end
end
