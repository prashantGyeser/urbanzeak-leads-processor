class AddUserIdToCities < ActiveRecord::Migration
  def change
    add_column :cities, :user_id, :string
  end
end
