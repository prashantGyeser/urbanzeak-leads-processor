class Api::V1::LeadStreamController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create_many

  def create_many
    array_of_streams = params[:_json]

    array_of_streams.each do |stream|
      puts stream["city"]
    end

  end
end
