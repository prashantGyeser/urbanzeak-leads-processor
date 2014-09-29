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
      begin
      rescue

      end
      datasift_calls.delete_push_subscription(subscription[:id].to_s)
    end
    return true
  end

  ######################################################################################################
  # Recreate all current subscriptions on the system
  # Todo: Test this and make sure the subscription is deleted and it is moved into the archive
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
          sleep(60.minutes)
          retry
        end

        subscription_attributes = subscription.attributes
        subscription_attributes.delete('id')

        new_datasift_subscription = DatasiftSubscription.new(subscription_attributes)

        if new_datasift_subscription.save
          subscription.destroy
        end

        #subscription[:datasift_subscription_id] = new_subscription[:data][:id]
        #subscription.save

        puts "Total subscriptions created: #{count}"
        count = count + 1
      end

    end

  end

  ######################################################################################################
  # Create subscriptions for streams that do not have a datasift subscription
  ######################################################################################################
  def create_subscriptions_for_stream_without_subscription
    datasift_calls = DatasiftCalls.new
    subscription_data = datasift_calls.get_push_subscriptions
    subscriptions = subscription_data[:data][:subscriptions]

    datasift_subscriptions = DatasiftSubscription.all

    datasift_subscriptions.each do |datasift_subscription|
      subscription_exists = false
      subscriptions.each do |subscription|
        if datasift_subscription[:datasift_subscription_id] == subscription[:id]
          subscription_exists = true
        end
      end

      if subscription_exists != true
        begin
          new_subscription = datasift_calls.create_push_subscription(datasift_subscription[:stream_hash], datasift_subscription[:subscription_name] )
          subscription_attributes = datasift_subscription.attributes
          subscription_attributes.delete('id')

          new_datasift_subscription = DatasiftSubscription.new(subscription_attributes)
          new_datasift_subscription[:datasift_subscription_id] = new_subscription[:id]


          if new_datasift_subscription.save
            datasift_subscription.destroy
          else
            begin
              datasift_calls.delete_push_subscription(new_subscription[:id])
            rescue
              puts "It is before the delete retry. Sleeping for 5 minutes..."
              sleep(5.minutes)
              retry
            end
          end

        rescue
          puts "The datasift api errored out. Going to sleep for 5 minutes..."
          sleep(5.minutes)
          retry
        end
      end
    end

  end


end