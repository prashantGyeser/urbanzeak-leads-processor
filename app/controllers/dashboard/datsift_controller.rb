require 'datasift_calls'

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

  def create_subscription

  end

end
