class AddUserIdToNonLeadTweetInCities < ActiveRecord::Migration
  def change
    add_column :non_lead_tweet_in_cities, :user_id, :integer
    add_column :non_lead_tweet_in_cities, :city_latlon_generate_for, :string
    add_column :non_lead_tweet_in_cities, :tweet_id, :string
  end
end
