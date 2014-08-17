# == Schema Information
#
# Table name: unprocessed_leads
#
#  id                       :integer          not null, primary key
#  tweet_poster_screen_name :string(255)
#  tweet_user_image         :string(255)
#  tweet_body               :text
#  user_location            :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#  city_latlon_generate_for :string(255)
#  tweet_id                 :string(255)
#

require 'rails_helper'

RSpec.describe UnprocessedLead, :type => :model do

  it "should only allow one tweet with the same id" do
    #UnprocessedLead.create(tweet_poster_screen_name: Faker::Internet.user_name('Nancy Johnson', %w(. _ -)), tweet_body: Faker::Lorem.sentence(2), user_location: Faker::Address.state_abbr, city_latlon_generate_for: Faker::Address.state_abbr)

    tweet_id = Faker::Number.number(18)

    UnprocessedLead.create(tweet_id: tweet_id)

    #expect(UnprocessedLead.create(tweet_id: tweet_id)).to eq "Id already exisits"

  end

end