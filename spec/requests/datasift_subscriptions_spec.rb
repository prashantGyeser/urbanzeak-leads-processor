require 'rails_helper'

RSpec.describe "DatasiftSubscriptions", :type => :request do
  describe "GET /datasift_subscriptions" do
    it "works! (now write some real specs)" do
      get datasift_subscriptions_path
      expect(response.status).to be(200)
    end
  end
end
