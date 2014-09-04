require 'datasift'

class DatasiftCalls

  def initialize
    config = {:username => 'prashantUZ', :api_key => '52c4c1cbb2e7493c48f3788d428c5dec', :enable_ssl => true}
    @datasift = DataSift::Client.new(config)
  end


  def get_push_subscriptions
    @datasift.push.get
  end

  def create_push_subscription(stream_hash, subscription_name)

    info_to_send = {hash: stream_hash, name: subscription_name, output_type: 's3', output_params: {format: 'json_meta', delivery_frequency: 0,bucket: 'datasift_output', auth: {access_key: 'AKIAISTIINAXFXZ3Y4QA', secret_key: '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' }, file_prefix: 'datasift', acl: 'private', directory: 'data' }, initial_status: 'active'}

    return @datasift.push.create info_to_send

  end

  def delete_push_subscription(subscription_id)
    @datasift.push.delete(subscription_id)
  end

  def start_push_subscription(subscription_id)
    @datasift.push.resume(subscription_id)
  end

  def stop_push_subscription(subscription_id)
    @datasift.push.stop(subscription_id)
  end

  def get_logs
    @datasift.push.log
  end

end