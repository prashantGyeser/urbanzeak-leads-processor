require 'twitter_search'

class Dashboard::TwitterSearchesController < Dashboard::ApplicationController
  before_action :set_dashboard_twitter_search, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/twitter_searches
  # GET /dashboard/twitter_searches.json
  def index
    @dashboard_twitter_search = Dashboard::TwitterSearch.new
  end

  # GET /dashboard/twitter_searches/1
  # GET /dashboard/twitter_searches/1.json
  def show
  end

  # GET /dashboard/twitter_searches/new
  def new
    @dashboard_twitter_search = Dashboard::TwitterSearch.new
  end

  # GET /dashboard/twitter_searches/1/edit
  def edit
  end

  # POST /dashboard/twitter_searches
  # POST /dashboard/twitter_searches.json
  def create

    puts "WooHoo! it is where it should be"

    @dashboard_twitter_search = Dashboard::TwitterSearch.new(dashboard_twitter_search_params)

    city = City.find(params[:dashboard_twitter_search][:city_id])

    logger.debug "The terms used are: #{params[:dashboard_twitter_search][:keyword]}, #{city.city_name}, #{params[:dashboard_twitter_search][:category_id]}, #{params[:dashboard_twitter_search][:city_id]}"

    twitter_search = TwitterSearch.new
    twitter_search.delay.admin_find_tweet_using_keyword_and_city(params[:dashboard_twitter_search][:keyword], city.city_name, params[:dashboard_twitter_search][:category_id], params[:dashboard_twitter_search][:city_id])


    respond_to do |format|
      if @dashboard_twitter_search.save
        format.html { redirect_to @dashboard_twitter_search, notice: 'Twitter search was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard_twitter_search }
      else
        format.html { render :new }
        format.json { render json: @dashboard_twitter_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/twitter_searches/1
  # PATCH/PUT /dashboard/twitter_searches/1.json
  def update
    respond_to do |format|
      if @dashboard_twitter_search.update(dashboard_twitter_search_params)
        format.html { redirect_to @dashboard_twitter_search, notice: 'Twitter search was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard_twitter_search }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_twitter_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/twitter_searches/1
  # DELETE /dashboard/twitter_searches/1.json
  def destroy
    @dashboard_twitter_search.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_twitter_searches_url, notice: 'Twitter search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_twitter_search
      @dashboard_twitter_search = Dashboard::TwitterSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_twitter_search_params
      params.require(:dashboard_twitter_search).permit(:keyword, :category_id, :city_id)
    end
end

