class CreateArticulos < ActiveRecord::Migration[7.0]
  def change
    create_table :articulos do |t|
      t.string :name
      t.references :subcategory, null: false, foreign_key: true
      t.references :marca, null: false, foreign_key: true

      t.timestamps
    end
  end
end
