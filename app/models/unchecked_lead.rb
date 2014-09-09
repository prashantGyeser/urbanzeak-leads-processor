# == Schema Information
#
# Table name: unchecked_leads
#
#  id                       :integer          not null, primary key
#  tweet_poster_screen_name :string(255)
#  tweet_user_image         :string(255)
#  tweet_body               :text
#  user_location            :string(255)
#  gnip_matching_rules      :text
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#  city_latlon_generate_for :string(255)
#  tweet_id                 :string(255)
#  status                   :boolean
#  delivered_at             :datetime
#  followers_count          :integer
#  friends_count            :integer
#  datasift_stream_hash     :string(255)
#  subscription_id          :string(255)
#  klout_score              :integer
#  lead_stream_id           :integer
#

require 'csv'

class UncheckedLead < ActiveRecord::Base

  validates_uniqueness_of :tweet_id, :scope => [:user_id]

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      # all.each do |item|
      #   csv << item.attributes.values_at(*column_names)
      # end

      find_each do |unchecked_lead|
        if unchecked_lead.status != true
          csv << unchecked_lead.attributes.values_at(*column_names)
          unchecked_lead.status = true
          unchecked_lead.save
        end
      end

    end
  end

end
