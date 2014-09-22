class RemoveTypeFromWordCounters < ActiveRecord::Migration
  def change
    remove_column :word_counters, :type, :string
  end
end
