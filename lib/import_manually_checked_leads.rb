require 'csv'

class ImportManuallyCheckedLeads

  def import_csv
    # retrieve the access key and secret key
    access_key_id = 'AKIAIFE4R4JUDV4G5Z2Q'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['urbanzeak_manually_checked_leads']

    bucket.objects.each do |object|
      csv_file = object.read

      begin
        rows = CSV.parse(csv_file, :headers => true)
        rows.each do |row|

          row_hash = row.to_hash
          is_lead = row_hash.delete("is_lead")
          row_hash.delete("status")
          row_hash.delete("id")

          if is_lead.downcase == "yes"
            Lead.create(row_hash)
          else
            TrainingNonLead.create(tweet_body: row["tweet_body"])
          end

        end
      rescue CSV::MalformedCSVError
        puts "Malformed csv row"
      end

      object.delete
      puts "Deleted manually checked lead file"

    end

  end

  #handle_asynchronously :import_csv

end