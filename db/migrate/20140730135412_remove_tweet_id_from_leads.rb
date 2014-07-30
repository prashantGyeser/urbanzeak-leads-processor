class RemoveTweetIdFromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :tweet_id, :string
    remove_column :leads, :tweet_poster_user_id, :string
    remove_column :leads, :tweet_poster_display_name, :string
    remove_column :leads, :tweet_user_summary, :text
    remove_column :leads, :tweet_user_friends_count, :integer
    remove_column :leads, :tweet_user_followers_count, :integer
    remove_column :leads, :tweet_post_time, :datetime
    remove_column :leads, :user_location_country_code, :string
  end
end
