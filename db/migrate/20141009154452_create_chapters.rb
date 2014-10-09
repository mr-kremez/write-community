class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :content
      t.references :book, index: true

      t.timestamps
    end
  end
end
