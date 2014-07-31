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

require 'rails_helper'

RSpec.describe ImporterError, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
