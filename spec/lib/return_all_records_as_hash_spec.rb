require 'rails_helper'
require 'return_all_records_as_hash.rb'
require 'faker'

RSpec.describe ReturnAllRecordsAsHash do

  before(:each) do
    @user = User.create(email: Faker::Internet.email)
    @lead = Lead.create(tweet_poster_screen_name: Faker::Internet.user_name(Faker::Name.name, %w(. _ -)), user_id: @user.id)
  end

  it "should return an array with a lead with the user email instead of user id" do
    array_of_leads = ReturnAllRecordsAsHash.array_of_leads
    expect(array_of_leads[0][:email]).to eq @user.email
  end

  it "should return an array with leads with user emails instead of user ids" do
    Lead.create(tweet_poster_screen_name: Faker::Internet.user_name(Faker::Name.name, %w(. _ -)), user_id: @user.id)
    Lead.create(tweet_poster_screen_name: Faker::Internet.user_name(Faker::Name.name, %w(. _ -)), user_id: @user.id)

    array_of_leads = ReturnAllRecordsAsHash.array_of_leads

    expect(array_of_leads).to include(
                                  {
                                      :email=>@user.email,
                                      :tweet_poster_screen_name=>@lead.tweet_poster_screen_name,
                                      :tweet_body=>nil,
                                      :user_location=>nil,
                                      :city_latlon_generate_for=>nil,
                                      :tweet_id=>nil
                                  }
                              )
  end

end