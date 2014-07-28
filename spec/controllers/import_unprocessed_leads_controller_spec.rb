require 'rails_helper'

RSpec.describe ImportUnprocessedLeadsController, :type => :controller do

  describe "GET s3_import" do
    it "returns http success" do
      get :s3_import
      expect(response).to be_success
    end
  end

end
