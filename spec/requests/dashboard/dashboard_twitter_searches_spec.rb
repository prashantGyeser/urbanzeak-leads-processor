require 'rails_helper'

RSpec.describe "Dashboard::TwitterSearches", :type => :request do
  describe "GET /dashboard_twitter_searches" do
    it "works! (now write some real specs)" do
      get dashboard_twitter_searches_path
      expect(response.status).to be(200)
    end
  end
end
