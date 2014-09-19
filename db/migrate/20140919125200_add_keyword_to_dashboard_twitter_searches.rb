class AddKeywordToDashboardTwitterSearches < ActiveRecord::Migration
  def change
    add_column :dashboard_twitter_searches, :keyword, :string
    add_column :dashboard_twitter_searches, :city, :string
  end
end
