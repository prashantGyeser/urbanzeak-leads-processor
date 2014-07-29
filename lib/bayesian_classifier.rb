require 'location_checker'
require 'keyword_checker'
require 'url_checker'

class BayesianClassifier
  def process_all_unprocessed_leads
    bayes_classifier = StuffClassifier::Bayes.new("Leads or Nonleads")

    training_leads = TrainingLead.all
    training_leads.each do |training_lead|
      bayes_classifier.train(:lead, training_lead.tweet_body)
    end

    non_leads = TrainingNonLead.all
    non_leads.each do |training_nonlead|
      bayes_classifier.train(:nonlead, training_nonlead.tweet_body)
    end

    unprocessed_leads = UnprocessedLead.all

    unprocessed_leads.each do |unprocessed_lead|
      if UrlChecker.does_not_contains_url?(unprocessed_lead.tweet_body)
        if LocationChecker.preferred_location_available?(unprocessed_lead.user_location)
          if bayes_classifier.classify(unprocessed_lead.tweet_body) == :lead
            Lead.create(tweet_poster_screen_name: unprocessed_lead.tweet_poster_screen_name, tweet_user_image: unprocessed_lead.tweet_user_image, tweet_body: unprocessed_lead.tweet_body, gnip_matching_rules: unprocessed_lead.gnip_matching_rules, user_location: unprocessed_lead.user_location)
            unprocessed_lead.destroy
          else
            unprocessed_lead.destroy
          end
        else
          unprocessed_lead.destroy
        end
      else
        unprocessed_lead.destroy
      end
    end
  end

  handle_asynchronously :process_all_unprocessed_leads

end