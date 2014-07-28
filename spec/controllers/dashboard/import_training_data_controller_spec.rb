require 'rails_helper'

RSpec.describe Dashboard::ImportTrainingDataController, :type => :controller do

  describe "GET import_leads" do
    it "returns http success" do
      get :import_leads
      expect(response).to be_success
    end
  end

  describe "GET import_non_leads" do
    it "returns http success" do
      get :import_non_leads
      expect(response).to be_success
    end
  end

end
