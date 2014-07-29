

require 'csv'
require 'csv_importer'

class Dashboard::ImportUnprocessedLeadsController < Dashboard::ApplicationController
  def s3_import

    # retrieve the access key and secret key
    access_key_id = 'AKIAJGCSGA4PHLWO7JJA'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['gnip_cleaned_output']

    # retrieve the objects
    bucket.objects.each do |object|

      CsvImporter.new.delay.save_rows_in_file_to_database(object)
    end
  end
end

