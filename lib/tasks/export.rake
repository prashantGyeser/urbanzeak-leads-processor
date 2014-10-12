require 'export_leads'

namespace :export do
  desc "Setups a new server with training data"
  task frontend: :environment do
    export_leads = ExportLeads.new
    export_leads.all_unsent_to_frontend
  end
end