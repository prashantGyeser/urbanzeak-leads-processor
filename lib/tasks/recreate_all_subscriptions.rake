require 'datasift_functions'

namespace :recreate do
  desc "Setups a new server with training data"
  task subscriptions: :environment do
    datasift_functions = DatasiftFunctions.new
    datasift_functions.recreate_all_subscriptions
  end
end