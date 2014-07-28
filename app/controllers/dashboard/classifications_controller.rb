require 'location_checker'
require 'keyword_checker'
require 'url_checker'


class Dashboard::ClassificationsController < ApplicationController
  def bayesian_processor

    bayes_classifier = StuffClassifier::Bayes.new("Leads or Nonleads")

    # Training the classifier
    leads = TrainingLead.all
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
          if bayes_classifier.classify(tweet_text) == :lead
            Lead.create(tweet_poster_screen_name: unprocessed_lead.tweet_poster_screen_name, tweet_user_image: unprocessed_lead.tweet_user_image, tweet_body: unprocessed_lead.tweet_body, gnip_matching_rules: unprocessed_lead.gnip_matching_rules, user_location: unprocessed_lead.user_location)
          end
        end
      end
    end


  end
end
