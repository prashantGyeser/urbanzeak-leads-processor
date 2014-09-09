class ReportsCollector

  def self.create_or_add(datasift_subscription_id, date_for_report)
    report_exists = ReportsCollector.check_if_datasift_report_record_exists?(datasift_subscription_id, date_for_report)

    if report_exists
      report = Report.where(datasift_subscription_id: datasift_subscription_id).where(date_collected: date_for_report).first
      report.total_tweets_for_day = report.total_tweets_for_day + 1
      report.save
    else
      report = Report.create(total_tweets_for_day: 1, datasift_subscription_id: datasift_subscription_id, date_collected: date_for_report )
    end

    return report

  end

  def self.check_if_datasift_report_record_exists?(datasift_subscription_id, date_for_report)

    if Report.where(datasift_subscription_id: datasift_subscription_id, date_collected: date_for_report).count > 0
      return true
    end
    return false

  end

  def self.get_datasift_subscription(subscription_id)

    datasift_subscription = DatasiftSubscription.find_by_datasift_subscription_id(subscription_id)
    if datasift_subscription
      return datasift_subscription
    else
      return false
    end

  end

end