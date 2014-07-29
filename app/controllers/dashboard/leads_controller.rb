class Dashboard::LeadsController < Dashboard::ApplicationController
  def index
    #@leads = Lead.all
    @leads = Lead.paginate(:page => params[:page], :per_page => 10)
  end

  def move_tweet_to_nonleads

    lead_to_move = Lead.find(params[:lead_id])
    TrainingNonLead.create(tweet_body: lead_to_move.tweet_body)
    lead_to_move.destroy

    respond_to do |format|
      format.json { render :json => {:message => "Success"} }
    end
  end
end
