class CreateSaleItems < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_items do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, foreign_key: true
      t.references :articulo, foreign_key: true
      t.integer :cantidad, null: false
      t.string :unidad_de_medida, null: false
      t.decimal :precio_unitario, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
