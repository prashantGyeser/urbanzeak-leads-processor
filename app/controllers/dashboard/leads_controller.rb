class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    @leads = Lead.all
  end
end
