class AddSubcategoryIdToMarcas < ActiveRecord::Migration[7.0]
  def change
    add_reference :marcas, :subcategory, null: false, foreign_key: true
  end
end
