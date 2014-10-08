# == Schema Information
#
# Table name: unique_lead_streams
#
#  id          :integer          not null, primary key
#  city_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe UniqueLeadStream, :type => :model do
  it { should validate_uniqueness_of(:city_id).scoped_to(:category_id) }

  it "should store only unique lead streams" do
    UniqueLeadStream.create(city_id: 1, category_id: 1)
    result = UniqueLeadStream.create(city_id: 1, category_id: 1)
    error_message = result.errors.messages
    expect(error_message[:city_id][0]).to eq  "has already been taken"
  end

end
