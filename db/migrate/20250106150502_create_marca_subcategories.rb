class CreateMarcaSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :marca_subcategories do |t|
      t.references :marca, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
