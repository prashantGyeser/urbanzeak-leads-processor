class CreateImporterStatuses < ActiveRecord::Migration
  def change
    create_table :importer_statuses do |t|
      t.string :file_name
      t.integer :number_of_rows_imported

      t.timestamps
    end
  end
end
