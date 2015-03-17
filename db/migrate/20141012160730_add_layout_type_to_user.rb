class AddLayoutTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :layout, :integer, default: 1 
  end
end
