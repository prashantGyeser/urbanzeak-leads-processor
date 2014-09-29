require 'location_checker'
require 'keyword_checker'
require 'url_checker'

class BayesianClassifier
  def process_all_unprocessed_leads
    bayes_classifier = StuffClassifier::Bayes.new("Leads or Nonleads")

    words_to_directly_remove = ['need','hungry','craving','crave']

    training_leads = TrainingLead.all
    training_leads.each do |training_lead|
      bayes_classifier.train(:lead, training_lead.tweet_body)
    end

    training_manually_checked_leads = Lead.all
    training_manually_checked_leads.each do |manually_checked_lead|
      bayes_classifier.train(:lead, manually_checked_lead.tweet_body)
    end

    non_leads = TrainingNonLead.all
    non_leads.each do |training_nonlead|
      bayes_classifier.train(:nonlead, training_nonlead.tweet_body)
    end

    UnprocessedLead.find_each do |unprocessed_lead|
      if UrlChecker.does_not_contains_url?(unprocessed_lead.tweet_body)

        if unprocessed_lead[:subscription_id].nil?
          # Todo: Add code to handle this when it comes from a lead stream
        else
          datasift_subscription_for_unprocessed_lead = ReportsCollector.get_datasift_subscription(unprocessed_lead[:subscription_id])
          report = ReportsCollector.create_or_add(datasift_subscription_for_unprocessed_lead[:id], unprocessed_lead[:created_at])
        end

        unprocessed_lead_attributes = unprocessed_lead.attributes
        unprocessed_lead_attributes.delete('id')

        if datasift_subscription_for_unprocessed_lead
          unprocessed_lead_attributes["datasift_subscription_id"] = datasift_subscription_for_unprocessed_lead[:id]
        end

        if bayes_classifier.classify(unprocessed_lead.tweet_body) == :lead
          contains_keyword = false
          words_to_directly_remove.each do |word|
            if contains_keyword != true
              if KeywordChecker.word_in_tweet?(unprocessed_lead.tweet_body, word)
                Lead.create(unprocessed_lead_attributes)
                words_to_directly_remove = true
              end
            end
          end

          if contains_keyword != true
            unchecked_lead = UncheckedLead.create(unprocessed_lead_attributes)
          end

        else

          contains_keyword = false
          words_to_directly_remove.each do |word|
            if contains_keyword != true
              if KeywordChecker.word_in_tweet?(unprocessed_lead.tweet_body, word)
                Lead.create(unprocessed_lead_attributes)
                words_to_directly_remove = true
              end
            end
          end

          if contains_keyword != true
            non_lead_tweet_in_city = NonLeadTweetInCity.create(unprocessed_lead_attributes)
          end
        end

      end

      unprocessed_lead.destroy
    end


  end
  # Todo: Enable this after writing the tests for this class
  #handle_asynchronously :process_all_unprocessed_leads

end