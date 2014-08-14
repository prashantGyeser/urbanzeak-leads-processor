namespace :twitter_search do
  desc "Starts the call to the twitter search"
  task initiate_for_users: :environment do
    SearchCaller.search_for_all_users
  end
end