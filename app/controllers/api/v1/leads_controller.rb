class Api::V1::LeadsController < ApplicationController

  def index
    @leads = Lead.where.not(:send => true)

    respond_to do |format|
      format.json { render :json => @leads }
    end

  end


end
