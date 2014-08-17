require 'rails_helper'

RSpec.describe "leads api", :type => :request do

  before(:each) do
    @user = User.create(email: Faker::Internet.email)
    @lead = Lead.create(tweet_poster_screen_name: Faker::Internet.user_name(Faker::Name.name, %w(. _ -)), user_id: @user.id)
  end

  it "returns 200" do
    expect(get "/api/v1/leads/index").to eq 200
  end

  it "should return leads" do
    get "/api/v1/leads/index"
    json = JSON.parse(response.body)
    expect(json).to include(
                           {
                               "email"=>@user.email,
                               "tweet_poster_screen_name"=>@lead.tweet_poster_screen_name,
                               "tweet_body"=>nil,
                               "user_location"=>nil,
                               "city_latlon_generate_for"=>nil,
                               "tweet_id"=>nil}
                       )
  end

end

# Lead.create(:tweet_poster_screen_name => "some_awesome_screename", :tweet_body => "this is a test tweet body", :user_id => 50, :user_location => "Some location", :city_latlon_generate_for => "NYC", :tweet_id => "3424332423423")
