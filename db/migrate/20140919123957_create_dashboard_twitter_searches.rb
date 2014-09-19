class CreateDashboardTwitterSearches < ActiveRecord::Migration
  def change
    create_table :dashboard_twitter_searches do |t|

      t.timestamps
    end
  end
end
