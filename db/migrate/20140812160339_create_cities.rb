class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :city_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
