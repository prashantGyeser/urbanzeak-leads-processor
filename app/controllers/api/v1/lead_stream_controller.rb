class Api::V1::LeadStreamController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create_many

  def create_many
    array_of_streams = params[:_json]

    array_of_streams.each do |stream|
      city = City.find_by_city_name(stream["city"])
      category = Category.find_by_name(stream["category"])

      puts "The city is: #{city.id}"

      UniqueLeadStream.create(city_id: city.id, category_id: category.id)
    end

    respond_to do |format|
      format.json { render :json => "Created sucessfully" }
    end


  end
end
