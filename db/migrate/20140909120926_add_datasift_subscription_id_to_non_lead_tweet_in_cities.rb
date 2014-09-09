class AddDatasiftSubscriptionIdToNonLeadTweetInCities < ActiveRecord::Migration
  def change
    add_column :non_lead_tweet_in_cities, :datasift_subscription_id, :integer
  end
end
