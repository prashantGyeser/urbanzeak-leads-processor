require 'rails_helper'
require 'import_manually_checked_leads'

RSpec.describe ImportManuallyCheckedLeads do
=begin

  it "should import a csv file with invalid rows" do
    file = File.dirname(__FILE__) + '/../fixtures/manually_checked_leads_csv_sample.csv'
    #csv_hash = ImportManuallyCheckedLeads.import_csv(file)
    #expect(csv_hash[0][:tweet_poster_screen_name]).to eq "regfromjerz"
  end

  it "should store the leads into the leads table" do
    Lead.destroy_all

    file = File.dirname(__FILE__) + '/../fixtures/manually_checked_leads_csv_sample.csv'
    csv_hash = ImportManuallyCheckedLeads.import_csv(file)
    #expect(Lead.all.count).to eq 1

  end
=end


  it "should parse and store each row based on if it is a lead or a non lead" do
    import_manually_checked_leads = ImportManuallyCheckedLeads.new
    import_manually_checked_leads.import_csv

    leads_count = Lead.count
    non_leads_count = TrainingNonLead.count

    expect(leads_count).to eq 4
    expect(non_leads_count).to eq 7
  end


end