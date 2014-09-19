json.array!(@dashboard_twitter_searches) do |dashboard_twitter_search|
  json.extract! dashboard_twitter_search, :id
  json.url dashboard_twitter_search_url(dashboard_twitter_search, format: :json)
end
