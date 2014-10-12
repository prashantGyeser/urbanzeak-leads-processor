require 'return_all_records_as_hash'

namespace :export do
  desc "Setups a new server with training data"
  task frontend: :environment do
    return_all_records_as_hash = ReturnAllRecordsAsHash.new

  end
end