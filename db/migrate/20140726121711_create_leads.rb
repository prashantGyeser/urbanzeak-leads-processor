class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :tweet_id
      t.string :tweet_poster_user_id
      t.string :tweet_poster_screen_name
      t.string :tweet_poster_profile_link
      t.string :tweet_poster_display_name
      t.string :tweet_user_image
      t.text :tweet_user_summary
      t.integer :tweet_user_friends_count
      t.integer :tweet_user_followers_count
      t.datetime :tweet_post_time
      t.text :tweet_body
      t.string :user_location
      t.string :user_location_country_code
      t.text :gnip_matching_rules

      t.timestamps
    end
  end
end
