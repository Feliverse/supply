class DropMarcaSubcategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :marca_subcategories
  end
end
