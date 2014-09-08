class AddStreamIdToNonLeadTweetInCities < ActiveRecord::Migration
  def change
    add_column :non_lead_tweet_in_cities, :delivered_at, :datetime
    add_column :non_lead_tweet_in_cities, :followers_count, :integer
    add_column :non_lead_tweet_in_cities, :friends_count, :integer
    add_column :non_lead_tweet_in_cities, :datasift_stream_hash, :string
    add_column :non_lead_tweet_in_cities, :subscription_id, :string
    add_column :non_lead_tweet_in_cities, :klout_score, :integer
  end
end
