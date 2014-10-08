class LeadStreamUtils

  def get_stream_without_subscription

    streams_without_subscription = []

    UniqueLeadStream.find_each do |unique_lead_stream|

      datasift_subscriptions = DatasiftSubscription.where(city_id: unique_lead_stream.city_id).where(category_id: unique_lead_stream.category_id)

      if datasift_subscriptions.count == 0
        streams_without_subscription << unique_lead_stream.id
      end

    end

    return streams_without_subscription

  end

end