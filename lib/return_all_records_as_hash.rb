class ReturnAllRecordsAsHash

  def self.array_of_leads

    array_of_lead_hashes = []

    Lead.find_each do |lead|

      lead_hash_with_keys_to_send = {}

      if lead.user_id.nil?

        datasift_subscription = DatasiftSubscription.find(lead.datasift_subscription_id)
        category = Category.find(datasift_subscription[:category_id])
        city = City.find(datasift_subscription.city_id)

        lead_hash_with_keys_to_send[:processor_datasift_subscription_id] = datasift_subscription.id
        lead_hash_with_keys_to_send[:city] = city.city_name
        lead_hash_with_keys_to_send[:category] = category.name
        lead_hash_with_keys_to_send[:klout_score] = lead.klout_score
      else
        user = User.find(lead.user_id)
        lead_hash_with_keys_to_send[:email] = user.email
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

    Report.find_each do |report|

      report_hash_with_keys_to_send = {}

      report_hash_with_keys_to_send[:total_tweets_for_day] = report.total_tweets_for_day
      report_hash_with_keys_to_send[:date_collected] = report.date_collected

      if report.datasift_subscription_id.blank?
        # Todo: Manage reports that are assocaited with lead streams
      else
        datasift_subscription = DatasiftSubscription.find(report.datasift_subscription_id)
        city = City.find(datasift_subscription.city_id)
        category = Category.find(datasift_subscription.category_id)
        report_hash_with_keys_to_send[:city] = city.city_name
        report_hash_with_keys_to_send[:category] = category.name
      end

      array_of_report_hashes << report_hash_with_keys_to_send

    end

    return array_of_report_hashes
  end


end