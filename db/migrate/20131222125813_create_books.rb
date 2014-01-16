class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :text
      t.integer :year

      t.timestamps
    end
  end
end
