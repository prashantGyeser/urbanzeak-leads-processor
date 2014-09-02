require 'location_checker'
require 'keyword_checker'
require 'url_checker'

class BayesianClassifier
  def process_all_unprocessed_leads
    bayes_classifier = StuffClassifier::Bayes.new("Leads or Nonleads")

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
      #if UrlChecker.does_not_contains_url?(unprocessed_lead.tweet_body)

        total_tweets_nyc = total_tweets_nyc + 1
        puts unprocessed_lead.user_location
        puts "Total tweets: #{total_tweets_nyc}"

        unprocessed_lead_attributes = unprocessed_lead.attributes
        unprocessed_lead_attributes.delete('id')

        if bayes_classifier.classify(unprocessed_lead.tweet_body) == :lead
          unchecked_lead = UncheckedLead.create(unprocessed_lead_attributes)

          if unchecked_lead.errors.full_messages.first == "Tweet has already been taken"
            Honeybadger.notify(
                :error_class   => "UncheckedLead Exists",
                :error_message => "UncheckedLead Exists: #{unprocessed_lead[:tweet_id]}",
                :parameters    => {user_id: unprocessed_lead[:user_id], tweet_id: unprocessed_lead[:tweet_id]}
            )
          end

        else
          non_lead_tweet_in_city = NonLeadTweetInCity.create(unprocessed_lead_attributes)

          if non_lead_tweet_in_city.errors.full_messages.first == "Tweet has already been taken"
            Honeybadger.notify(
                :error_class   => "NonLeadTweetInCity Exists",
                :error_message => "NonLeadTweetInCity Exists: #{unprocessed_lead[:tweet_id]}",
                :parameters    => {user_id: unprocessed_lead[:user_id], tweet_id: unprocessed_lead[:tweet_id]}
            )
          end

        end

      #end

      unprocessed_lead.destroy


      #unprocessed_lead.destroy
      processed_count = processed_count + 1
    end


  end

  handle_asynchronously :process_all_unprocessed_leads

end