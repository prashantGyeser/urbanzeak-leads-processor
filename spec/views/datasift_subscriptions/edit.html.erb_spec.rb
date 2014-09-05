require 'rails_helper'

RSpec.describe "datasift_subscriptions/edit", :type => :view do
  before(:each) do
    @datasift_subscription = assign(:datasift_subscription, DatasiftSubscription.create!(
      :datasift_subscription_id => "MyString",
      :stream_hash => "MyString",
      :subscription_name => "MyString",
      :query => "MyText"
    ))
  end

  it "renders the edit datasift_subscription form" do
    render

    assert_select "form[action=?][method=?]", datasift_subscription_path(@datasift_subscription), "post" do

      assert_select "input#datasift_subscription_datasift_subscription_id[name=?]", "datasift_subscription[datasift_subscription_id]"

      assert_select "input#datasift_subscription_stream_hash[name=?]", "datasift_subscription[stream_hash]"

      assert_select "input#datasift_subscription_subscription_name[name=?]", "datasift_subscription[subscription_name]"

      assert_select "textarea#datasift_subscription_query[name=?]", "datasift_subscription[query]"
    end
  end
end
