require 'import_manually_checked_leads'
require 'csv'

class Dashboard::ImportManuallyCheckedLeadsController < ApplicationController
  def import

    import_manually_checked_leads = ImportManuallyCheckedLeads.new
    import_manually_checked_leads.import_csv

  end
end
