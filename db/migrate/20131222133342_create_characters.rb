class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :group
      t.text :text

      t.timestamps
    end
  end
end
