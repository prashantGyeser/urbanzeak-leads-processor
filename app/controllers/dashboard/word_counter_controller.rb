require 'keyword_checker'

class Dashboard::WordCounterController < Dashboard::ApplicationController
  def index
    @word_to_check = params[:word]

    @leads_with_word = Lead.records_containing_word(@word_to_check)
    @unchecked_non_leads_with_word = NonLeadTweetInCity.records_containing_word(@word_to_check)
    @non_leads_with_word = TrainingNonLead.records_containing_word(@word_to_check)

  end
end

