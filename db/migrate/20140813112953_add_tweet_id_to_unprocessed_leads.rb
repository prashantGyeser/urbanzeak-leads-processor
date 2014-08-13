class AddTweetIdToUnprocessedLeads < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :tweet_id, :integer
  end
end
