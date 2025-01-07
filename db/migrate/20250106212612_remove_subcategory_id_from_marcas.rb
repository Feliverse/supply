class RemoveSubcategoryIdFromMarcas < ActiveRecord::Migration[7.0]
  def change
    remove_column :marcas, :subcategory_id, :bigint
  end
end
