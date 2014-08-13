class CreateOauthTokens < ActiveRecord::Migration
  def change
    create_table :oauth_tokens do |t|
      t.integer :user_id
      t.string :oauth_token
      t.string :oauth_secret
      t.string :provider

      t.timestamps
    end
  end
end
