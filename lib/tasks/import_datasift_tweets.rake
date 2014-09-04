require 'import_datasift_tweets'

namespace :import do
  desc "Setups a new server with training data"
  task datasift_tweets: :environment do
    import_datasift_tweets = ImportDatasiftTweets.new
    import_datasift_tweets.import_json
  end
end