require 'json'

class DatasiftJsonParser

  def self.return_datasift_interactions(json_to_parse)

    begin
      parsed_json = JSON.parse(json_to_parse)
      return parsed_json["interactions"]
    rescue JSON::ParserError => parse_error

      Honeybadger.notify(
          :error_class   => "Datasift JSON parse error",
          :error_message => "Datasift JSON parse error: #{parse_error.message}",
          :parameters    => {json_object: json_to_parse.to_s}
      )

      return "Invalid json! This json object has been logged to honeybadger"
    end

  end

  def self.return_subscription_details(json_to_parse)
    begin
      parsed_json = JSON.parse(json_to_parse)
      subscription_details = {}
      subscription_details[:datasift_stream_hash] = parsed_json["hash"]
      subscription_details[:delivered_at] = parsed_json["delivered_at"].to_datetime
      subscription_details[:id] = parsed_json["id"]
      return subscription_details

    rescue JSON::ParserError => parse_error
      Honeybadger.notify(
          :error_class   => "Datasift JSON parse error",
          :error_message => "Datasift JSON parse error: #{parse_error.message}",
          :parameters    => {json_object: json_to_parse.to_s}
      )

      return "Invalid json! This json object has been logged to honeybadger"
    end
  end



end