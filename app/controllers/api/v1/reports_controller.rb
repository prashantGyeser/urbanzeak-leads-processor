class Api::V1::ReportsController < ApplicationController
  def all

    reports = ReturnAllRecordsAsHash.array_of_reports

    respond_to do |format|
      format.json { render :json => reports }
    end

  end
end
