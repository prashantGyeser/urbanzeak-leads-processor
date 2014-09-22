class AddTweetTypeToWordCounters < ActiveRecord::Migration
  def change
    add_column :word_counters, :tweet_type, :string
  end
end
