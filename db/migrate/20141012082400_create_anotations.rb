class CreateAnotations < ActiveRecord::Migration
  def change
    create_table :anotations do |t|
      t.text :body
      t.references :chapter, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
