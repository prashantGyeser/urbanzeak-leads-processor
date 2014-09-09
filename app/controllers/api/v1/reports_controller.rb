class Api::V1::ReportsController < ApplicationController
  def all

    reports = Report.all

    respond_to do |format|
      format.json { render :json => reports }
    end

  end
end
