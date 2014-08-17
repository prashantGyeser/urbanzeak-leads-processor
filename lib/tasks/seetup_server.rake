namespace :server do
  desc "Setups a new server with training data"
  task setup: :environment do
    training_data = TrainingData.new
    training_data.import_from_s3
  end
end