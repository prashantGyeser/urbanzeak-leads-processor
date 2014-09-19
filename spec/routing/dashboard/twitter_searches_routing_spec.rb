require "rails_helper"

RSpec.describe Dashboard::TwitterSearchesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dashboard/twitter_searches").to route_to("dashboard/twitter_searches#index")
    end

    it "routes to #new" do
      expect(:get => "/dashboard/twitter_searches/new").to route_to("dashboard/twitter_searches#new")
    end

    it "routes to #show" do
      expect(:get => "/dashboard/twitter_searches/1").to route_to("dashboard/twitter_searches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dashboard/twitter_searches/1/edit").to route_to("dashboard/twitter_searches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dashboard/twitter_searches").to route_to("dashboard/twitter_searches#create")
    end

    it "routes to #update" do
      expect(:put => "/dashboard/twitter_searches/1").to route_to("dashboard/twitter_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dashboard/twitter_searches/1").to route_to("dashboard/twitter_searches#destroy", :id => "1")
    end

  end
end
