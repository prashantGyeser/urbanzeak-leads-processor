require 'rails_helper'
require 'return_all_records_as_hash.rb'
require 'faker'

RSpec.describe ReturnAllRecordsAsHash do

  before(:each) do
    @user = create(:user)
    @category = create(:category)
    @city = create(:city)
    @datasift_subscription = create(:datasift_subscription, category_id: @category.id, city_id: @city.id)
  end

  it "should return an array with a lead with the user email instead of user id" do
    lead = create(:lead, user_id: @user[:id])
    array_of_leads = ReturnAllRecordsAsHash.array_of_leads
    expect(array_of_leads[0][:email]).to eq @user.email
  end

  it "should return an array with a valid city and category associated with datasift streams" do
    lead = create(:lead, datasift_subscription_id: @datasift_subscription[:id])
    array_of_leads = ReturnAllRecordsAsHash.array_of_leads
    expect(array_of_leads[0][:processor_datasift_subscription_id]).to eq @datasift_subscription.id
  end

  it "should return a list of report rows with valid cities and categories" do
    report = Report.create(total_tweets_for_day: Faker::Number.number(3), datasift_subscription_id: @datasift_subscription.id, date_collected: Date.today)
    reports = ReturnAllRecordsAsHash.array_of_reports

    expect(reports[0][:city]).to eq @city.city_name

  end

  it "should return a valid array of hashes given a lead generated from the admin twitter api" do
    lead = create(:lead, category_id: @category.id, city_id: @city.id)
    array_of_leads = ReturnAllRecordsAsHash.array_of_leads
    expect(array_of_leads[0][:city]).to eq @city.city_name
  end


  it "should return a valid array of hashes given a lead generated from the admin twitter api and datasift" do
    lead = create(:lead, category_id: @category.id, city_id: @city.id)
    lead = create(:lead, datasift_subscription_id: @datasift_subscription[:id])
    array_of_leads = ReturnAllRecordsAsHash.array_of_leads
    expect(array_of_leads[1][:city]).to eq @city.city_name
  end


end