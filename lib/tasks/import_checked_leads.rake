namespace :import do
  desc "Setups a new server with training data"
  task manually_checked_leads: :environment do
    import_manually_checked_leads = ImportManuallyCheckedLeads.new
    import_manually_checked_leads.import_csv
  end
end