class Dashboard::HomeController < Dashboard::ApplicationController
  def index

    #HardWorker.perform_async('bob', 5)

    TweetCollector.perform_async(2)

  end
end
