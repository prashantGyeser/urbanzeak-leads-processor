class Dashboard::HomeController < Dashboard::ApplicationController
  def index

    HardWorker.perform_async('bob', 5)

  end
end
