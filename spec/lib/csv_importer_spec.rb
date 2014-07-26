require 'spec_helper'
require 'csv_importer'

RSpec.describe CsvImporter do

  it "should check if a given path is right" do
    expect(CsvImporter.save_rows_in_file_to_database("test.txt")).to eq "Invalid file, please make sure the path is right"
  end

  it "should check if a given file is a valid csv file" do
    expect(CsvImporter.save_rows_in_file_to_database("test.txt")).to eq "This will work better is you uploaded a CSV file! In case you did not get it, this did not work, try again with a valid CSV"
  end




end