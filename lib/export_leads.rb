require 'return_all_records_as_hash'

class ExportLeads

  def all_unsent_to_frontend
    unsent_leads = ExportLeads.get_unsent_leads

    puts "The server being connected to id: #{ENV['FRONTEND_SERVER_URL']}"

    frontend_server_url = ENV['FRONTEND_SERVER_URL'] + '/api/v1/leads/batch_create.json'

    puts "It is getting to just before the post: #{frontend_server_url}"

    response = HTTParty.post(frontend_server_url,
                             :body => unsent_leads.to_json,
                             :headers => { 'Content-Type' => 'application/json' })

    puts "Finished posting"

    puts "The response is: #{response.inspect}"


    case response.code
      when 200
        puts "All good!"
        #Lead.update_all(:sent => true)
      when 404
        puts "Not found!"
      when 500...600
        puts "OMG ERROR #{response.code}"
    end

  end

  def self.get_unsent_leads
    return_all_records_as_hash = ReturnAllRecordsAsHash.new
    return return_all_records_as_hash.leads_array_in_batches(10)
  end

end