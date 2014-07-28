class Dashboard::ImportTrainingDataController < ApplicationController
  def import_leads
    # retrieve the access key and secret key
    access_key_id = 'AKIAJGCSGA4PHLWO7JJA'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['gnip_cleaned_output']

    # retrieve the objects
    bucket.objects.each do |object|
      #logger.debug object.read
      csv_file = object.read
      csv_text = CSV.parse(csv_file)
      csv_text.each do |row|
        tweet_body = row[0]
        TrainingLead.create(:tweet_body => tweet_body)
      end
      object.delete
    end
  end

  def import_non_leads
    # retrieve the access key and secret key
    access_key_id = 'AKIAJGCSGA4PHLWO7JJA'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    # get the bucket
    bucket = s3.buckets['gnip_cleaned_output']

    # retrieve the objects
    bucket.objects.each do |object|
      #logger.debug object.read
      csv_file = object.read
      csv_text = CSV.parse(csv_file)
      csv_text.each do |row|
        tweet_body = row[0]
        TrainingNonLead.create(:tweet_body => tweet_body)
      end
      object.delete
    end
  end
end
