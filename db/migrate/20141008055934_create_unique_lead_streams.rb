class CreateUniqueLeadStreams < ActiveRecord::Migration
  def change
    create_table :unique_lead_streams do |t|
      t.integer :city_id
      t.integer :category_id

      t.timestamps
    end
  end
end
