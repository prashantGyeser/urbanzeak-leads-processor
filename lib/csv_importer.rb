require 'data_parser'
require 'csv'

class CsvImporter
  def save_rows_in_file_to_database
    puts "It has started the s3 import"
    # retrieve the access key and secret key
    access_key_id = 'AKIAJGCSGA4PHLWO7JJA'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['gnip_cleaned_output']
    # retrieve the objects
    puts "Before iterating over the objects in amazon"
    bucket.objects.each do |object|
      aws_file_key = object.key
      csv_file = object.read
      count = 1
      malformed_count = 1
      #CsvImporter.new.delay.save_rows_in_file_to_database(object)
      puts "Before the error loop"
      begin
        rows = CSV.parse(csv_file)
        rows.each_with_index do |row, index|
          ImporterStatus.create(file_name: aws_file_key, number_of_rows_imported: index)
          puts "Processing row: #{count}"
          count = count +1
          tweet_hash = DataParser.convert_row_into_hash(row)
          UnprocessedLead.create(tweet_hash)
        end


        #rows.each do |row|
        # CSV.foreach(csv_file) do |row|
        #   puts "Importing row: #{count}"
        #   count = count +1
        #   tweet_hash = DataParser.convert_row_into_hash(row)
        #   UnprocessedLead.create(tweet_poster_screen_name: tweet_hash[:tweet_poster_screen_name], tweet_user_image: tweet_hash[:tweet_user_image], tweet_body: tweet_hash[:tweet_body], gnip_matching_rules: tweet_hash[:gnip_matching_rules], user_location: tweet_hash[:user_location] )
        #
        #
        # end
      rescue CSV::MalformedCSVError => e
        ImporterError.create(file_name: aws_file_key, error_message_generated: e.inspect)
        puts "Malformed csv row: #{malformed_count}"
        malformed_count = malformed_count + 1
      end

    end
  end

  handle_asynchronously :save_rows_in_file_to_database

end