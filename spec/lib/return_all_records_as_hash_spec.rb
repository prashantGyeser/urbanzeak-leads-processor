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
    #expect(non_lead[:datasift_subscription]).to eq 2
  end

end