require 'data_parser'
require 'csv'

class CsvImporter
  def save_rows_in_file_to_database
    # retrieve the access key and secret key
    access_key_id = 'AKIAJGCSGA4PHLWO7JJA'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['gnip_cleaned_output']

    # retrieve the objects
    bucket.objects.each do |object|
      csv_file = object.read
      count = 1
      #CsvImporter.new.delay.save_rows_in_file_to_database(object)
      rows = CSV.parse(csv_file)
      rows.each do |row|
        count = count +1
        tweet_hash = DataParser.convert_row_into_hash(row)
        UnprocessedLead.create(tweet_hash)
      end
    end
  end

  handle_asynchronously :save_rows_in_file_to_database
end