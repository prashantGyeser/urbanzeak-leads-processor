require 'datasift_calls'

class DatasiftSubscriptionsController < ApplicationController
  before_action :set_datasift_subscription, only: [:show, :edit, :update, :destroy]

  # GET /datasift_subscriptions
  # GET /datasift_subscriptions.json
  def index
    @datasift_subscriptions = DatasiftSubscription.all
  end

  # GET /datasift_subscriptions/1
  # GET /datasift_subscriptions/1.json
  def show
  end

  # GET /datasift_subscriptions/new
  def new
    @datasift_subscription = DatasiftSubscription.new
  end

  # GET /datasift_subscriptions/1/edit
  def edit
  end

  # POST /datasift_subscriptions
  # POST /datasift_subscriptions.json
  def create
    @datasift_subscription = DatasiftSubscription.new(datasift_subscription_params)

    datasift_calls = DatasiftCalls.new
    new_subscription = datasift_calls.create_push_subscription(params[:datasift_subscription][:stream_hash], params[:datasift_subscription][:subscription_name] )

    @datasift_subscription[:datasift_subscription_id] = new_subscription[:data][:id]


    respond_to do |format|
      if @datasift_subscription.save
        #format.html { redirect_to @datasift_subscription, notice: 'Datasift subscription was successfully created.' }
        flash[:notice] = "Datasift subscription was successfully created with id: #{@datasift_subscription.id}"
        format.html { redirect_to dashboard_datsift_subscriptions_path }
        format.json { render :show, status: :created, location: @datasift_subscription }
      else
        format.html { render :new }
        format.json { render json: @datasift_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasift_subscriptions/1
  # PATCH/PUT /datasift_subscriptions/1.json
  def update
    respond_to do |format|
      if @datasift_subscription.update(datasift_subscription_params)
        format.html { redirect_to @datasift_subscription, notice: 'Datasift subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @datasift_subscription }
      else
        format.html { render :edit }
        format.json { render json: @datasift_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasift_subscriptions/1
  # DELETE /datasift_subscriptions/1.json
  def destroy

    datasift_subscription_attributes = @datasift_subscription.attributes
    datasift_subscription_attributes.delete ["id"]
    deleted_datasift_subscription = DeletedDatasiftSubscription.new(datasift_subscription_attributes)

    if deleted_datasift_subscription.save
      @datasift_subscription.destroy
      respond_to do |format|

        datasift_calls = DatasiftCalls.new
        datasift_calls.delete_push_subscription(@datasift_subscription[:datasift_subscription_id])

        flash[:notice] = "Datasift subscription was successfully destroyed."
        format.html { redirect_to dashboard_datsift_subscriptions_path }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datasift_subscription
      @datasift_subscription = DatasiftSubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datasift_subscription_params
      params.require(:datasift_subscription).permit(:datasift_subscription_id, :stream_hash, :subscription_name, :query)
    end
end
