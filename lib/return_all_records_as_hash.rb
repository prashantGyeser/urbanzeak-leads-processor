class ReturnAllRecordsAsHash

  def self.array_of_leads

    array_of_lead_hashes = []

    Lead.find_each do |lead|

      lead_hash_with_keys_to_send = {}

      if lead.user_id.nil?

        datasift_subscription = DatasiftSubscription.find(lead.datasift_subscription_id)
        category = Category.find(datasift_subscription[:category_id])
        city = City.find(datasift_subscription.city_id)

        lead_hash_with_keys_to_send[:datasift_subscription] = datasift_subscription.datasift_subscription_id
        lead_hash_with_keys_to_send[:is_datasift_stream] = true
        lead_hash_with_keys_to_send[:city] = city.city_name
        lead_hash_with_keys_to_send[:category] = category.name
      else
        user = User.find(lead.user_id)
        lead_hash_with_keys_to_send[:email] = user.email
        lead_hash_with_keys_to_send[:is_datasift_stream] = false
      end


      lead_hash_with_keys_to_send[:tweet_poster_screen_name] = lead.tweet_poster_screen_name
      lead_hash_with_keys_to_send[:tweet_body] = lead.tweet_body
      lead_hash_with_keys_to_send[:user_location] = lead.user_location
      lead_hash_with_keys_to_send[:tweet_id] = lead.tweet_id

      array_of_lead_hashes << lead_hash_with_keys_to_send

    end

    return array_of_lead_hashes

  end

  def self.array_of_reports
    array_of_report_hashes = []

    Report.find_each do |lead|

      report_hash_with_keys_to_send = {}

      lead_hash_with_keys_to_send[:email] = user.email
      lead_hash_with_keys_to_send[:tweet_poster_screen_name] = lead.tweet_poster_screen_name
      lead_hash_with_keys_to_send[:tweet_body] = lead.tweet_body
      lead_hash_with_keys_to_send[:user_location] = lead.user_location
      lead_hash_with_keys_to_send[:city_latlon_generate_for] = lead.city_latlon_generate_for
      lead_hash_with_keys_to_send[:tweet_id] = lead.tweet_id

      array_of_lead_hashes << lead_hash_with_keys_to_send

    end

    return array_of_lead_hashes
  end


end