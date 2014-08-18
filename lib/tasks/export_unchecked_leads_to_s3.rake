namespace :export do
  desc "Setups a new server with training data"
  task unchecked_leads: :environment do
    export_unchecked_leads = ExportUncheckedLeads.new
    export_unchecked_leads.export
  end
end