class CreateWordCounters < ActiveRecord::Migration
  def change
    create_table :word_counters do |t|
      t.string :word
      t.string :tweet_body
      t.string :type

      t.timestamps
    end
  end
end
