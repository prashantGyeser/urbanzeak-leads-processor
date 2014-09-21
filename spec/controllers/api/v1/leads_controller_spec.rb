require 'rails_helper'

RSpec.describe Api::V1::LeadsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index, format: :json
      expect(response).to be_success
    end
  end

end
