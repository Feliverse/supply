class AddSubcategoryIdAndMarcaIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :subcategory_id, :bigint
    add_column :products, :marca_id, :bigint
  end
end
