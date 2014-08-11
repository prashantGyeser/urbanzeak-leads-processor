class RemoveTweetIdFromUnprocessedLead < ActiveRecord::Migration
  def change
    remove_column :unprocessed_leads, :tweet_id, :string
    remove_column :unprocessed_leads, :tweet_poster_user_id, :string
    remove_column :unprocessed_leads, :tweet_poster_profile_link, :string
    remove_column :unprocessed_leads, :tweet_poster_display_name, :string
    remove_column :unprocessed_leads, :tweet_user_summary, :text
    remove_column :unprocessed_leads, :tweet_user_friends_count, :integer
    remove_column :unprocessed_leads, :tweet_user_followers_count, :integer
    remove_column :unprocessed_leads, :tweet_post_time, :datetime
    remove_column :unprocessed_leads, :user_location_country_code, :string
    remove_column :unprocessed_leads, :gnip_matching_rules, :text
    remove_column :unprocessed_leads, :processed, :boolean
  end
end
