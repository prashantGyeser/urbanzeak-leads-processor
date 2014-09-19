class AddCategoryIdToNonLeadTweetInCities < ActiveRecord::Migration
  def change
    add_column :non_lead_tweet_in_cities, :category_id, :integer
    add_column :non_lead_tweet_in_cities, :city_id, :integer
  end
end
