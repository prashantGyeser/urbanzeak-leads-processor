class CreateDeletedTweets < ActiveRecord::Migration
  def change
    create_table :deleted_tweets do |t|
      t.string :tweet_id
      t.string :screen_name

      t.timestamps
    end
  end
end
