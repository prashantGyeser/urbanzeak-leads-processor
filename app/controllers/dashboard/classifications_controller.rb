require 'location_checker'
require 'keyword_checker'
require 'url_checker'
require 'bayesian_classifier'

class Dashboard::ClassificationsController < ApplicationController
  def bayesian_processor
    bayesian_classifier = BayesianClassifier.new
    bayesian_classifier.process_all_unprocessed_leads
  end
end
