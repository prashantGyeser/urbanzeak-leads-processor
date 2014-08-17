require 'rails_helper'

RSpec.describe UncheckedLeadsController, :type => :controller do

  describe "GET export" do
    it "returns http success" do
      get :export
      expect(response).to be_success
    end
  end

end
