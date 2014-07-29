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
    puts "Finished positive training"
    puts "Beginning negative training"
    non_leads = TrainingNonLead.all
    non_leads.each do |training_nonlead|
      bayes_classifier.train(:nonlead, training_nonlead.tweet_body)
    end
    puts "Finished negative training"

    processed_count = 1
    puts "Beginning classification"
    UnprocessedLead.find_each do |unprocessed_lead|
      puts "Item classification start"
      if UrlChecker.does_not_contains_url?(unprocessed_lead.tweet_body)
        #if LocationChecker.preferred_location_available?(unprocessed_lead.user_location)
          if bayes_classifier.classify(unprocessed_lead.tweet_body) == :lead
            Lead.create(tweet_poster_screen_name: unprocessed_lead.tweet_poster_screen_name, tweet_user_image: unprocessed_lead.tweet_user_image, tweet_body: unprocessed_lead.tweet_body, gnip_matching_rules: unprocessed_lead.gnip_matching_rules, user_location: unprocessed_lead.user_location)
          end
        #end
      end

      #unprocessed_lead.destroy
      puts "The processed count is: #{processed_count}"
      processed_count = processed_count + 1
    end


  end

  handle_asynchronously :process_all_unprocessed_leads

end