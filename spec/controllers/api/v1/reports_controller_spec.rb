require 'rails_helper'

RSpec.describe Api::V1::ReportsController, :type => :controller do

  describe "GET all" do
    it "returns http success" do
      get :all
      expect(response).to be_success
    end
  end

end
