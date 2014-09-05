require 'rails_helper'

RSpec.describe Dashboard::DatsiftController, :type => :controller do

  describe "GET subscriptions" do
    it "returns http success" do
      get :subscriptions
      expect(response).to be_success
    end
  end

  describe "GET billing" do
    it "returns http success" do
      get :billing
      expect(response).to be_success
    end
  end

  describe "GET logs" do
    it "returns http success" do
      get :logs
      expect(response).to be_success
    end
  end

end
