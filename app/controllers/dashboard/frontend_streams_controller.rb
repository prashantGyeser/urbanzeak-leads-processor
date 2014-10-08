class Dashboard::FrontendStreamsController < Dashboard::ApplicationController
  def index
    @unique_lead_streams = UniqueLeadStream.all
  end
end
