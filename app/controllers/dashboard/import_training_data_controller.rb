require 'training_data'

class Dashboard::ImportTrainingDataController < ApplicationController
  def import_data
    training_data = TrainingData.new
    training_data.import_from_s3
  end
end
