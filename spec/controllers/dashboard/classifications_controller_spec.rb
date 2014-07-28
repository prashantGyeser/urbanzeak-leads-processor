require 'rails_helper'

RSpec.describe Dashboard::ClassificationsController, :type => :controller do

  describe "GET bayesian_processor" do
    it "returns http success" do
      get :bayesian_processor
      expect(response).to be_success
    end
  end

end
