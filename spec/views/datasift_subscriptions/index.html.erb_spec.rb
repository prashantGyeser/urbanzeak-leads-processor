require 'rails_helper'

RSpec.describe "datasift_subscriptions/index", :type => :view do
  before(:each) do
    assign(:datasift_subscriptions, [
      DatasiftSubscription.create!(
        :datasift_subscription_id => "Datasift Subscription",
        :stream_hash => "Stream Hash",
        :subscription_name => "Subscription Name",
        :query => "MyText"
      ),
      DatasiftSubscription.create!(
        :datasift_subscription_id => "Datasift Subscription",
        :stream_hash => "Stream Hash",
        :subscription_name => "Subscription Name",
        :query => "MyText"
      )
    ])
  end

  it "renders a list of datasift_subscriptions" do
    render
    assert_select "tr>td", :text => "Datasift Subscription".to_s, :count => 2
    assert_select "tr>td", :text => "Stream Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Subscription Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
