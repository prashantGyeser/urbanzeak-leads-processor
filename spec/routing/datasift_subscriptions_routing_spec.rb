require "rails_helper"

RSpec.describe DatasiftSubscriptionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/datasift_subscriptions").to route_to("datasift_subscriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/datasift_subscriptions/new").to route_to("datasift_subscriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/datasift_subscriptions/1").to route_to("datasift_subscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/datasift_subscriptions/1/edit").to route_to("datasift_subscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/datasift_subscriptions").to route_to("datasift_subscriptions#create")
    end

    it "routes to #update" do
      expect(:put => "/datasift_subscriptions/1").to route_to("datasift_subscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/datasift_subscriptions/1").to route_to("datasift_subscriptions#destroy", :id => "1")
    end

  end
end
