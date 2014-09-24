require 'location_checker'
require 'keyword_checker'
require 'url_checker'

class BayesianClassifier
  def process_all_unprocessed_leads
    bayes_classifier = StuffClassifier::Bayes.new("Leads or Nonleads")

    words_to_directly_remove = ['need','hungry','craving','crave']

    puts "Beginning training"

    training_leads = TrainingLead.all
    training_leads.each do |training_lead|
      bayes_classifier.train(:lead, training_lead.tweet_body)
    end

    training_manually_checked_leads = Lead.all
    training_manually_checked_leads.each do |manually_checked_lead|
      bayes_classifier.train(:lead, manually_checked_lead.tweet_body)
    end

    puts "Finished positive training"
    puts "Beginning negative training"
    non_leads = TrainingNonLead.all
    non_leads.each do |training_nonlead|
      bayes_classifier.train(:nonlead, training_nonlead.tweet_body)
    end
    puts "Finished negative training"

    total_tweets_nyc = 0

    processed_count = 1
    puts "Beginning classification"
    UnprocessedLead.find_each do |unprocessed_lead|
      if UrlChecker.does_not_contains_url?(unprocessed_lead.tweet_body)

        if unprocessed_lead[:subscription_id].nil?
          # Todo: Add code to handle this when it comes from a lead stream
        else
          datasift_subscription_for_unprocessed_lead = ReportsCollector.get_datasift_subscription(unprocessed_lead[:subscription_id])
          report = ReportsCollector.create_or_add(datasift_subscription_for_unprocessed_lead[:id], unprocessed_lead[:created_at])
        end

        total_tweets_nyc = total_tweets_nyc + 1
        puts unprocessed_lead.user_location
        puts "Total tweets: #{total_tweets_nyc}"

        unprocessed_lead_attributes = unprocessed_lead.attributes
        unprocessed_lead_attributes.delete('id')

        if datasift_subscription_for_unprocessed_lead
          unprocessed_lead_attributes["datasift_subscription_id"] = datasift_subscription_for_unprocessed_lead[:id]
        end

        if bayes_classifier.classify(unprocessed_lead.tweet_body) == :lead

          words_to_directly_remove.each do |word|
            if KeywordChecker.word_in_tweet?(unprocessed_lead.tweet_body, word)
              Lead.create(unprocessed_lead_attributes)
            else
              unchecked_lead = UncheckedLead.create(unprocessed_lead_attributes)
            end
          end

        else
          non_lead_tweet_in_city = NonLeadTweetInCity.create(unprocessed_lead_attributes)
          puts non_lead_tweet_in_city[:tweet_id]
          if non_lead_tweet_in_city.errors.full_messages.first == "Tweet has already been taken"
            Honeybadger.notify(
                :error_class   => "NonLeadTweetInCity Exists",
                :error_message => "NonLeadTweetInCity Exists: #{unprocessed_lead[:tweet_id]}",
                :parameters    => {user_id: unprocessed_lead[:user_id], tweet_id: unprocessed_lead[:tweet_id]}
            )
          end

        end

      end

      unprocessed_lead.destroy
      processed_count = processed_count + 1
    end


  end
  # Todo: Enable this after writing the tests for this class
  handle_asynchronously :process_all_unprocessed_leads

end