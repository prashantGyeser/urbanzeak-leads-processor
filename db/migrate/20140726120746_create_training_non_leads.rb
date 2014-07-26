class CreateTrainingNonLeads < ActiveRecord::Migration
  def change
    create_table :training_non_leads do |t|
      t.text :tweet_body

      t.timestamps
    end
  end
end
