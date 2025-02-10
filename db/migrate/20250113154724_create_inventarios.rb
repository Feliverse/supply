class CreateInventarios < ActiveRecord::Migration[7.0]
  def change
    create_table :inventarios do |t|
      t.integer :cantidad_disponible, null: false
      t.datetime :fecha_actualizacion, null: false
      t.integer :cantidad_real, null: false, default: 0
      
      
      t.references :almacen, null: false, foreign_key: true
      t.references :product, foreign_key: true
      t.references :articulo, foreign_key: true

      t.timestamps
    end
  end
end
