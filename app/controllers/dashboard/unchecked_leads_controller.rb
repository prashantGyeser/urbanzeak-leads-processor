class Dashboard::UncheckedLeadsController < Dashboard::ApplicationController
  def export_as_csv

    @unchecked_leads = UncheckedLead.order(:id)

    respond_to do |format|
      format.html
      format.csv {render text: @unchecked_leads.to_csv}
    end

  end
end
