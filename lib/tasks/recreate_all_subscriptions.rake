require 'datasift_functions'

namespace :recreate do
  desc "Setups a new server with training data"
  task subscriptions: :environment do
    datasift_functions = DatasiftFunctions.new
    datasift_functions.create_subscriptions_for_stream_without_subscription
  end
end