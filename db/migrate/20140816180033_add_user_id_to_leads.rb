class AddUserIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :user_id, :integer
    add_column :leads, :city_latlon_generate_for, :string
    add_column :leads, :tweet_id, :string
  end
end
