json.array!(@datasift_subscriptions) do |datasift_subscription|
  json.extract! datasift_subscription, :id, :datasift_subscription_id, :stream_hash, :subscription_name, :query
  json.url datasift_subscription_url(datasift_subscription, format: :json)
end
