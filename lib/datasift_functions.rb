require 'datasift_calls'

class DatasiftFunctions

  ######################################################################################################
  # Delete all the current subscriptions on datasift
  ######################################################################################################
  def delete_all_subscriptions_on_datasift

    datasift_calls = DatasiftCalls.new
    begin
      subscriptions_data = datasift_calls.get_push_subscriptions
    rescue
      puts "It is before the delete retry. Sleeping for 5 minutes..."
      sleep(5.minutes)
      retry
    end
    subscriptions = subscriptions_data[:data][:subscriptions]
    subscriptions.each do |subscription|
      puts subscription[:id]
      puts "Sleeping...."
      sleep(2.minutes)
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
      puts "Total subscriptions to be created = #{datasift_subscriptions.count}"
      count = 1
      datasift_subscriptions.each do |subscription|
        begin
          puts "Sleeping...."
          sleep(2.minutes)
          new_subscription = datasift_calls.create_push_subscription(subscription[:stream_hash], subscription[:subscription_name] )
        rescue
          puts "It is before the create retry. Sleeping for 5 minutes..."
          sleep(5.minutes)
          retry
        end

        subscription[:datasift_subscription_id] = new_subscription[:data][:id]
        subscription.save

        puts "Total subscriptions created: #{count}"
        count = count + 1
      end

    end

  end

end