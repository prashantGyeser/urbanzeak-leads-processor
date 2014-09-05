require 'rails_helper'

RSpec.describe "datasift_subscriptions/show", :type => :view do
  before(:each) do
    @datasift_subscription = assign(:datasift_subscription, DatasiftSubscription.create!(
      :datasift_subscription_id => "Datasift Subscription",
      :stream_hash => "Stream Hash",
      :subscription_name => "Subscription Name",
      :query => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Datasift Subscription/)
    expect(rendered).to match(/Stream Hash/)
    expect(rendered).to match(/Subscription Name/)
    expect(rendered).to match(/MyText/)
  end
end
