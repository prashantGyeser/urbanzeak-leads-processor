class CreateUncheckedLeads < ActiveRecord::Migration
  def change
    create_table :unchecked_leads do |t|
      t.string :tweet_poster_screen_name
      t.string :tweet_user_image
      t.text :tweet_body
      t.string :user_location
      t.text :gnip_matching_rules

      t.timestamps
    end
  end
end
