class AddAttributesToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :client_nit, :string
    add_column :sales, :client_name, :string
  end
end
