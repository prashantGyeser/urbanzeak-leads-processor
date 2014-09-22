require 'keyword_checker'

class Dashboard::WordCounterController < Dashboard::ApplicationController
  def index
    #@word_to_check = params[:word]

    @search_words = WordCounter.uniq.pluck(:word)

  end
end

