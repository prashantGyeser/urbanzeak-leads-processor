# == Schema Information
#
# Table name: importer_errors
#
#  id                      :integer          not null, primary key
#  file_name               :string(255)
#  error_message_generated :text
#  created_at              :datetime
#  updated_at              :datetime
#

class ImporterError < ActiveRecord::Base
end
