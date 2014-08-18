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





end