class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :total_tweets_for_day
      t.date :date_collected
      t.integer :lead_stream_id

      t.timestamps
    end
  end
end
