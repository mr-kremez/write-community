class AddBlockedToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :blocked, :boolean, :default => false, :null => false
    add_index  :users, :blocked
  end

  def self.down
    remove_index  :users, :blocked
    remove_column :users, :blocked
  end
end
