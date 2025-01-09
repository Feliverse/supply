class CreateJoinTableMarcaSubcategory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :marcas, :subcategories do |t|
      t.index :marca_id
      t.index :subcategory_id
    end
  end
end
