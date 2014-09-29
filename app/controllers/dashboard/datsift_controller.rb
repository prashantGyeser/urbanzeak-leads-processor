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

  def recreate_all

    datasift_subscriptions = DatasiftSubscription.all
    datasift_subscriptions.each do |subscription|
      datasift_calls = DatasiftCalls.new
      new_subscription = datasift_calls.create_push_subscription(subscription[:stream_hash], subscription[:subscription_name] )
      subscription[:datasift_subscription_id] = new_subscription[:data][:id]
      subscription.save
    end
    flash[:notice] = "Successfully recreated all subscriptions."
    redirect_to dashboard_datsift_subscriptions_path
  end

end
