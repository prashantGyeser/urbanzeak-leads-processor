class CreateUserKeywords < ActiveRecord::Migration
  def change
    create_table :user_keywords do |t|
      t.integer :keyword_id
      t.integer :user_id
      t.datetime :last_queried

      t.timestamps
    end
  end
end
