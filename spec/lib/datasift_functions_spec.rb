require 'datasift_functions'
require 'rails_helper'

RSpec.describe DatasiftFunctions do

  it "should delete all the subscriptions currently on datasift" do
    expect(DatasiftFunctions.delete_all_subscriptions_on_datasift).to eq true
  end

end