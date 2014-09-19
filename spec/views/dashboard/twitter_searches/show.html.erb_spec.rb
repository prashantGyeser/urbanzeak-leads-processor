require 'rails_helper'

RSpec.describe "dashboard/twitter_searches/show", :type => :view do
  before(:each) do
    @dashboard_twitter_search = assign(:dashboard_twitter_search, Dashboard::TwitterSearch.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
