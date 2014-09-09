require 'reports_collector'
require 'rails_helper'
require 'faker'

RSpec.describe ReportsCollector do

  it "should add a new report record given a valid new unprocessed lead" do

    datasift_subscription = DatasiftSubscription.create(datasift_subscription_id: Faker::Lorem.characters(10), stream_hash: Faker::Lorem.characters(10), subscription_name: Faker::Lorem.characters(10), datasift_subscription_id: Faker::Lorem.characters(10) )

    unprocessed_lead = {tweet_poster_screen_name: Faker::Internet.user_name('Nancy Johnson', %w(. _ -)), tweet_body: Faker::Lorem.characters(110), user_location: Faker::Address.city, tweet_id: Faker::Lorem.characters(16), datasift_stream_hash: Faker::Lorem.characters(10), subscription_id: datasift_subscription[:datasift_subscription_id], klout_score: Faker::Number.number(2)}


    datasift_subscription_for_unprocessed_lead = ReportsCollector.get_datasift_subscription(unprocessed_lead[:subscription_id])
    results = ReportsCollector.create_or_add(datasift_subscription_for_unprocessed_lead[:id], unprocessed_lead[:created_at])
    #expect(results[:total_tweets_for_day]).to eq 1

    expect(results[:total_tweets_for_day]).to eq 1

  end

  it "should add a new report record given a valid new unprocessed lead" do

    datasift_subscription = DatasiftSubscription.create(datasift_subscription_id: Faker::Lorem.characters(10), stream_hash: Faker::Lorem.characters(10), subscription_name: Faker::Lorem.characters(10), datasift_subscription_id: Faker::Lorem.characters(10) )

    unprocessed_lead = {tweet_poster_screen_name: Faker::Internet.user_name('Nancy Johnson', %w(. _ -)), tweet_body: Faker::Lorem.characters(110), user_location: Faker::Address.city, tweet_id: Faker::Lorem.characters(16), datasift_stream_hash: Faker::Lorem.characters(10), subscription_id: datasift_subscription[:datasift_subscription_id], klout_score: Faker::Number.number(2)}


    datasift_subscription_for_unprocessed_lead = ReportsCollector.get_datasift_subscription(unprocessed_lead[:subscription_id])
    ReportsCollector.create_or_add(datasift_subscription_for_unprocessed_lead[:id], unprocessed_lead[:created_at])
    results = ReportsCollector.create_or_add(datasift_subscription_for_unprocessed_lead[:id], unprocessed_lead[:created_at])
    #expect(results[:total_tweets_for_day]).to eq 1

    expect(results[:total_tweets_for_day]).to eq 2

  end


  it "should return true when a record already exists" do
    report = Report.create(total_tweets_for_day: 1, datasift_subscription_id: Faker::Lorem.characters(10), date_collected: Time.now)
    result = ReportsCollector.check_if_datasift_report_record_exists?(report.datasift_subscription_id, report.date_collected)
    expect(result).to eq true
  end

  it "should return false if a record with the current unprocessed subscription and date does not exist" do
    result = ReportsCollector.check_if_datasift_report_record_exists?(Faker::Lorem.characters(10), Time.now )
    expect(result).to eq false
  end

  it "should return a datasift record given a valid subscription id" do
    datasift_subscription = DatasiftSubscription.create(datasift_subscription_id: Faker::Lorem.characters(10), stream_hash: Faker::Lorem.characters(10), subscription_name: Faker::Lorem.characters(10))
    results = ReportsCollector.get_datasift_subscription(datasift_subscription.datasift_subscription_id)
    expect(results[:id]).to eq datasift_subscription.id
  end

  it "should return a datasift record given an invalid subscription id" do
    datasift_subscription = DatasiftSubscription.create(datasift_subscription_id: Faker::Lorem.characters(10), stream_hash: Faker::Lorem.characters(10), subscription_name: Faker::Lorem.characters(10))
    results = ReportsCollector.get_datasift_subscription(Faker::Lorem.characters(5))
    expect(results).to eq false
  end

end