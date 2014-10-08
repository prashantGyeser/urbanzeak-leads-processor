require 'datasift_functions'
require 'datasift_query'

class Dashboard::DatsiftController < Dashboard::ApplicationController
  def subscriptions
    datasift_call = DatasiftCalls.new
    subscriptions = datasift_call.get_push_subscriptions
    @all_subscriptions = subscriptions[:data][:subscriptions]

    @datasift_subscription = DatasiftSubscription.new



    @subscriptions = DatasiftSubscription.all
  end

  def billing
  end

  def logs
    datasift =  DatasiftCalls.new
    @logs = datasift.get_logs
  end

  def recreate_all
    datasift_functions = DatasiftFunctions.new

    datasift_functions.delay.recreate_all_subscriptions

    flash[:notice] = "Successfully added the recreate to the queue."
    redirect_to dashboard_datsift_subscriptions_path
  end

end
