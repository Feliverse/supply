class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.datetime :fecha
      t.references :cliente, null: false, foreign_key: true
      t.references :almacen, null: false, foreign_key: true


      t.timestamps
    end
  end
end
