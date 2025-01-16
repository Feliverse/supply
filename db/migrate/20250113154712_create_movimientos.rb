class CreateMovimientos < ActiveRecord::Migration[7.0]
  def change
    create_table :movimientos do |t|
      t.string :tipo, null: false
      t.decimal :cantidad, precision: 5, scale: 2, null: false
      t.datetime :fecha , null: false

      t.references :almacen, null: false, foreign_key: true
      t.references :product, foreign_key: true
      t.references :articulo, foreign_key: true

      t.timestamps
    endd
  end
end
