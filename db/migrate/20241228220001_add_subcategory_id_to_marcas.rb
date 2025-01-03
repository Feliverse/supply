class AddSubcategoryIdToMarcas < ActiveRecord::Migration[6.1]
  def change
    add_reference :marcas, :subcategory, null: false, foreign_key: true
  end
end
