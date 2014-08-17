class TrainingData
  def import_from_s3
    # retrieve the access key and secret key
    access_key_id = 'AKIAIFE4R4JUDV4G5Z2Q'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['urbanzeak_training_data']

    bucket.objects.each do |object|
      csv_file = object.read
      begin
        rows = CSV.parse(csv_file)
        rows.each do |row|
          lead = {}
          lead[:tweet_body] = row[2]
          lead[:is_lead] = row[1]

          if lead[:is_lead].downcase == 'yes'
            puts "Adding lead"
            TrainingLead.create(:tweet_body => lead[:tweet_body])
          else
            puts "Adding non lead"
            TrainingNonLead.create(tweet_body: lead[:tweet_body])
          end
        end
      rescue CSV::MalformedCSVError
        puts "Malformed csv row"
      end
    end
  end

  handle_asynchronously :import_from_s3

end