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

require 'rails_helper'

RSpec.describe ImporterStatus, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
