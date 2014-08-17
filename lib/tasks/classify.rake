namespace :classify do
  desc "Runs the bayesian classifier"
  task begin_classification: :environment do
    bayesian_classifier = BayesianClassifier.new
    bayesian_classifier.process_all_unprocessed_leads
  end
end