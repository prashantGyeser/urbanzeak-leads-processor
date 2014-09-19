require 'rails_helper'

RSpec.describe "dashboard/twitter_searches/edit", :type => :view do
  before(:each) do
    @dashboard_twitter_search = assign(:dashboard_twitter_search, Dashboard::TwitterSearch.create!())
  end

  it "renders the edit dashboard_twitter_search form" do
    render

    assert_select "form[action=?][method=?]", dashboard_twitter_search_path(@dashboard_twitter_search), "post" do
    end
  end
end
