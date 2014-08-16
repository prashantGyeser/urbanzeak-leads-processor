class AddUserIdToUncheckedLeads < ActiveRecord::Migration
  def change
    add_column :unchecked_leads, :user_id, :integer
    add_column :unchecked_leads, :city_latlon_generate_for, :string
    add_column :unchecked_leads, :tweet_id, :string
  end
end
