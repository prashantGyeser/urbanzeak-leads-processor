require 'datasift_json_parser'

class ImportDatasiftTweets

  def import_json
    # retrieve the access key and secret key
    access_key_id = 'AKIAIFE4R4JUDV4G5Z2Q'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)


    items_imported = 0
    tweet_import_errors = 0
    total_tweets_where_score_is_nil = 0

    # get the bucket
    bucket = s3.buckets['datasift_output']

    bucket.objects.each do |object|


      if object.key != 'data/'
        json_content = object.read

        begin
          subscription_details = DatasiftJsonParser.return_subscription_details(json_content)
          datasift_interactions = DatasiftJsonParser.return_datasift_interactions(json_content)

          puts "It got past the parser and onto the collector"

          datasift_interactions.each do |interaction|
            unprocessed_lead_to_store_hash = {}
            unprocessed_lead_to_store_hash[:tweet_poster_screen_name] = interaction["interaction"]["author"]["username"]
            unprocessed_lead_to_store_hash[:tweet_id] = interaction["twitter"]["id"]
            unprocessed_lead_to_store_hash[:tweet_body] = interaction["twitter"]["text"]
            unprocessed_lead_to_store_hash[:user_location] = interaction["twitter"]["user"]["location"]
            unprocessed_lead_to_store_hash[:datasift_stream_hash] = subscription_details[:datasift_stream_hash]
            unprocessed_lead_to_store_hash[:delivered_at] = subscription_details[:delivered_at]
            unprocessed_lead_to_store_hash[:subscription_id] = subscription_details[:id]
            if interaction["klout"]["score"].nil?
              puts "The klout score is nil"
              total_tweets_where_score_is_nil = 0
            else
              unprocessed_lead_to_store_hash[:klout_score] = interaction["klout"]["score"]
            end

            unprocessed_lead = UnprocessedLead.new(unprocessed_lead_to_store_hash)

            if unprocessed_lead.save
              puts "The unprocessed lead is: #{unprocessed_lead.id}"
            else
              tweet_import_errors = tweet_import_errors + 1
              puts "Something went wrong #{unprocessed_lead.errors}"
            end
            puts "Non klout scores: #{total_tweets_where_score_is_nil}"
            puts "Import errors are: #{tweet_import_errors}"
          end

        rescue => e
          Honeybadger.notify(
              :error_class   => "Datasift import error",
              :error_message => "Datasift import error: #{e.message}",
              :parameters    => {json_object: e.to_s}
          )
        end

        items_imported = items_imported + 1

      end

    end
    puts "total import errors are: #{tweet_import_errors}"
    puts "Total tweets with no klout score: #{total_tweets_where_score_is_nil}"
  end

  #handle_asynchronously :import_csv

end