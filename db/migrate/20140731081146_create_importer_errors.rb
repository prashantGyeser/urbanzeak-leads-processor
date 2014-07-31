class CreateImporterErrors < ActiveRecord::Migration
  def change
    create_table :importer_errors do |t|
      t.string :file_name
      t.text :error_message_generated

      t.timestamps
    end
  end
end
