

require 'csv'
require 'csv_importer'

class Dashboard::ImportUnprocessedLeadsController < Dashboard::ApplicationController
  def s3_import
    csv_importer = CsvImporter.new
    csv_importer.save_rows_in_file_to_database
  end
end

