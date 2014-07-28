require 'data_parser'

class CsvImporter
  def self.save_rows_in_file_to_database(csv_file)
    count = 1
    rows = CSV.parse(csv_file)
    rows.each do |row|
      puts count
      count = count +1
      tweet_hash = DataParser.convert_row_into_hash(row)
      UnprocessedLead.create(tweet_hash)
    end
  end
end