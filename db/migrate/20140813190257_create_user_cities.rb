class CreateUserCities < ActiveRecord::Migration
  def change
    create_table :user_cities do |t|
      t.integer :city_id
      t.integer :user_id

      t.timestamps
    end
  end
end
