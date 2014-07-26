class CreateTrainingLeads < ActiveRecord::Migration
  def change
    create_table :training_leads do |t|
      t.text :tweet_body

      t.timestamps
    end
  end
end
