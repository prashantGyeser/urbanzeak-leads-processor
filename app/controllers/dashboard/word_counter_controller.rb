require 'keyword_checker'

class Dashboard::WordCounterController < Dashboard::ApplicationController
  def index
    @word_to_check = params[:word]

    @leads_with_word = Lead.records_containing_word(@word_to_check)

  end
end

