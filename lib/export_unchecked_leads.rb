require 'csv'

class ExportUncheckedLeads

  def export

    # CSV.generate do |csv|
    #   csv << UncheckedLead.column_names
    #
    #   UncheckedLead.find_each do |unchecked_lead|
    #     #if unchecked_lead.status != true
    #       csv << unchecked_lead.attributes.values_at(*column_names)
    #       unchecked_lead.status = true
    #       unchecked_lead.save
    #     #end
    #   end
    #
    #   file_name = Time.now.utc.to_s.gsub(/\s+/, "")
    #   CSV.open("#{Rails.root}/tmp/#{file_name}.csv", "w") do |writer|
    #     writer << csv
    #   end
    #
    # end

    file_name = Time.now.utc.to_s.gsub(/\s+/, "")

    CSV.open("#{Rails.root}/tmp/#{file_name}.csv", "wb") do |csv|
      csv << UncheckedLead.column_names
      UncheckedLead.find_each do |unchecked_lead|
        #if unchecked_lead.status != true
          csv << unchecked_lead.attributes.values_at(*UncheckedLead.column_names)
          #unchecked_lead.status = true
          #unchecked_lead.save
        #end
      end
    end


  end

end