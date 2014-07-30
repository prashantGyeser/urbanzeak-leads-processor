require 'csv'

class ImportManuallyCheckedLeads

  def import_csv
    # retrieve the access key and secret key
    access_key_id = 'AKIAJGCSGA4PHLWO7JJA'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['gnip_cleaned_output']

    bucket.objects.each do |object|
      csv_file = object.read
      #begin
        rows = CSV.parse(csv_file)
        rows.each do |row|
          lead = {}
          lead[:tweet_poster_screen_name] = row[0]
          lead[:tweet_user_image] = row[1]
          lead[:tweet_body] = row[3]
          lead[:user_location] = row[4]
          lead[:gnip_matching_rules] = row[5]
          lead[:gnip_matching_rules] = row[6]

          if row[2].downcase == 'yes'
            Lead.create(lead)
          else
            TrainingNonLead.create(tweet_body: row[3])
          end
        end
      #rescue CSV::MalformedCSVError
        puts "Malformed csv row"
      #end
      object.delete
    end



  end

  handle_asynchronously :import_csv

end