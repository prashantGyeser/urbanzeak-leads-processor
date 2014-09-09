class AddLeadStreamIdToNonLeadTweetInCities < ActiveRecord::Migration
  def change
    add_column :non_lead_tweet_in_cities, :lead_stream_id, :integer
  end
end
