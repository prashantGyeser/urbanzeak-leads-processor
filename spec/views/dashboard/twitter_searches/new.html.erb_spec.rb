require 'rails_helper'

RSpec.describe "dashboard/twitter_searches/new", :type => :view do
  before(:each) do
    assign(:dashboard_twitter_search, Dashboard::TwitterSearch.new())
  end

  it "renders new dashboard_twitter_search form" do
    render

    assert_select "form[action=?][method=?]", dashboard_twitter_searches_path, "post" do
    end
  end
end
