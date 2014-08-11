class Dashboard::HomeController < Dashboard::ApplicationController
  def index


    #
    # users = User.all
    #
    # users.each do |user|
    #   puts "Starting up the process for : #{user.id}"
    #   TweetCollector.perform_async(user.id)
    # end

    @status = LocationChecker.preferred_location_available?("NY/NJ")




  end
end
