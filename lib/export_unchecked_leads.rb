require 'csv'

class ExportUncheckedLeads

  def export
    file_name = Time.now.utc.to_s.gsub(/\s+/, "")

    # retrieve the access key and secret key
    access_key_id = 'AKIAIFE4R4JUDV4G5Z2Q'
    secret_access_key = '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'

    # create an instance of the s3 client
    s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

    obj = s3.buckets['urbanzeak_unchecked_leads'].objects["#{file_name}.csv"] # no request made


    CSV.open("#{Rails.root}/tmp/#{file_name}.csv", "wb") do |csv|
      csv << UncheckedLead.column_names
      UncheckedLead.find_each do |unchecked_lead|
        if unchecked_lead.status != true
          csv << unchecked_lead.attributes.values_at(*UncheckedLead.column_names)
          unchecked_lead.status = true
          unchecked_lead.save
        end
      end
    end


    file_path = "#{Rails.root}/tmp/#{file_name}.csv"
    obj.write(:file => file_path)

  end

end