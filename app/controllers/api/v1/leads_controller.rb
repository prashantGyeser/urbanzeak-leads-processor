require 'return_all_records_as_hash'

class Api::V1::LeadsController < ApplicationController

  def index

    leads = ReturnAllRecordsAsHash.array_of_leads

    puts leads

    respond_to do |format|
      format.json { render :json => leads }
    end

  end


end
