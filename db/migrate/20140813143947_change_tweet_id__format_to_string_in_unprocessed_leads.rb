class ChangeTweetIdFormatToStringInUnprocessedLeads < ActiveRecord::Migration
  def change
    change_column(:unprocessed_leads, :tweet_id, :string)
  end
end
