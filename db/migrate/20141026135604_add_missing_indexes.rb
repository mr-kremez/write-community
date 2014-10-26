class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :overall_averages, [:rateable_id, :rateable_type]
    add_index :average_caches, :rater_id
    add_index :average_caches, [:rateable_id, :rateable_type]
  end
end