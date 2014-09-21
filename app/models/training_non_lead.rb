# == Schema Information
#
# Table name: training_non_leads
#
#  id         :integer          not null, primary key
#  tweet_body :text
#  created_at :datetime
#  updated_at :datetime
#

class TrainingNonLead < ActiveRecord::Base
  def self.records_containing_word(word)
    training_non_lead_with_word_array = []
    TrainingNonLead.find_each do |training_non_lead|
      if KeywordChecker.word_in_tweet?(training_non_lead.tweet_body, word)
        lead_with_word_array << training_non_lead
      end
    end
    return training_non_lead_with_word_array
  end
end
