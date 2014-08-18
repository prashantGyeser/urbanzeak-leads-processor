require 'rails_helper'
require 'export_unchecked_leads'
require 'faker'

RSpec.describe ExportUncheckedLeads do

  before(:each) do

    i = 0
    while i< 100
      user = User.create(email: Faker::Internet.email)

      UncheckedLead.create(tweet_poster_screen_name: Faker::Internet.user_name, tweet_body: Faker::Lorem.characters(100), user_location: Faker::Address.city, user_id: user.id, city_latlon_generate_for: Faker::Address.city, tweet_id: Faker::Lorem.characters(16) )

      i = i + 1
    end
  end

  it "should return a csv object" do
    export_unchecked_leads = ExportUncheckedLeads.new
    export_unchecked_leads.export

    expect(Rails.root).to eq true

  end

end