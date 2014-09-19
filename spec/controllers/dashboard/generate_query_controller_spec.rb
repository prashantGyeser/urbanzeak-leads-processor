require 'rails_helper'

RSpec.describe Dashboard::GenerateQueryController, :type => :controller do

  describe "GET datasift" do
    it "returns http success" do
      get :datasift
      expect(response).to be_success
    end
  end

end
