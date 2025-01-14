class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :name, null: false
      t.string :nit, null: false

      t.timestamps
    end
  end
end
