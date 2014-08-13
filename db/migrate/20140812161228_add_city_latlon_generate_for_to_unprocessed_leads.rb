class AddCityLatlonGenerateForToUnprocessedLeads < ActiveRecord::Migration
  def change
    add_column :unprocessed_leads, :city_latlon_generate_for, :string
  end
end
