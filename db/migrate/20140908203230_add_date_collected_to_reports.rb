class AddDateCollectedToReports < ActiveRecord::Migration
  def change
    add_column :reports, :date_collected, :datetime
  end
end
