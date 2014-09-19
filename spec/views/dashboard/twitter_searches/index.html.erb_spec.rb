require 'rails_helper'

RSpec.describe "dashboard/twitter_searches/index", :type => :view do
  before(:each) do
    assign(:dashboard_twitter_searches, [
      Dashboard::TwitterSearch.create!(),
      Dashboard::TwitterSearch.create!()
    ])
  end

  it "renders a list of dashboard/twitter_searches" do
    render
  end
end
