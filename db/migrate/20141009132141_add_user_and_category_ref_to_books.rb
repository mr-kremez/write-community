class AddUserAndCategoryRefToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :user, index: true
    add_reference :books, :category, index: true
  end
end
