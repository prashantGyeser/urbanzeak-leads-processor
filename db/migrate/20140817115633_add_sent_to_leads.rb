class AddSentToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :sent, :boolean
  end
end
