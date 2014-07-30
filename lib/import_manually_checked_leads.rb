require 'smarter_csv'

class ImportManuallyCheckedLeads
  def self.import_csv(file_path)
    quote_chars = %w(" | ~ ^ & *)
    begin
      return SmarterCSV.process(file_path, headers: :first_row, quote_char: quote_chars.shift)
    rescue CSV::MalformedCSVError
      quote_chars.empty? ? raise : retry
    end





  end
end