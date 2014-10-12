require 'rails_helper'
require 'export_leads'

RSpec.describe ExportLeads do

  before(:each) do
    @user = create(:user)
    @category = create(:category)
    @city = create(:city)
    @datasift_subscription = create(:datasift_subscription, category_id: @category.id, city_id: @city.id)
  end


  it "should send the leads that have not already been send to the frontend" do

    lead = create(:lead, category_id: @category.id, city_id: @city.id)
    lead = create(:lead, datasift_subscription_id: @datasift_subscription[:id])

    export_leads = ExportLeads.new
    export_leads.all_unsent_to_frontend
  end


end