class CreateTwitterOauthKeys < ActiveRecord::Migration
  def change
    create_table :twitter_oauth_keys do |t|
      t.integer :user_id
      t.string :consumer_key
      t.string :consumer_secret
      t.string :oauth_token
      t.string :oauth_token_secret

      t.timestamps
    end
  end
end
