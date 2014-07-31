# == Schema Information
#
# Table name: importer_statuses
#
#  id                      :integer          not null, primary key
#  file_name               :string(255)
#  number_of_rows_imported :integer
#  created_at              :datetime
#  updated_at              :datetime
#

class ImporterStatus < ActiveRecord::Base
end
