require 'datasift_calls'

class DatasiftFunctions

  ######################################################################################################
  # Delete all the current subscriptions on datasift
  ######################################################################################################
  def delete_all_subscriptions_on_datasift

    datasift_calls = DatasiftCalls.new
    subscriptions_data = datasift_calls.get_push_subscriptions
    subscriptions = subscriptions_data[:data][:subscriptions]
    subscriptions.each do |subscription|
      puts subscription[:id]
      datasift_calls.delete_push_subscription(subscription[:id].to_s)
    end
    return true
  end

  ######################################################################################################
  # Recreate all current subscriptions on the system
  ######################################################################################################
  def recreate_all_subscriptions

    datasift_calls = DatasiftCalls.new
    puts "It is getting to before the delete"

    subscriptions_deleted = delete_all_subscriptions_on_datasift
    puts "It is getting to before the delete"
    if subscriptions_deleted == true
      puts "It is getting to before the create  "
      datasift_subscriptions = DatasiftSubscription.all

      datasift_subscriptions.each do |subscription|
        new_subscription = datasift_calls.create_push_subscription(subscription[:stream_hash], subscription[:subscription_name] )
        subscription[:datasift_subscription_id] = new_subscription[:data][:id]
        subscription.save
      end

    end

  end

end