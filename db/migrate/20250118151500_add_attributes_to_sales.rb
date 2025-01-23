class AddAttributesToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :unidad_de_medida, :string
    add_column :sales, :precio_unitario, :decimal, precision: 10, scale: 2
  end
end
