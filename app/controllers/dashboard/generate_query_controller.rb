require 'datasift_query'

class Dashboard::GenerateQueryController < Dashboard::ApplicationController
  def datasift

    # Sample call to generate a datasift query
    # http://localhost:3000/dashboard/generate_datasift_query?keywords=beer,shots,party,cocktails&city=Chicago

    @keywords = params[:keywords]
    @city = params[:city]

    datasift_query = DatasiftQuery.new
    @query = datasift_query.generate(@keywords, @city)

  end
end
