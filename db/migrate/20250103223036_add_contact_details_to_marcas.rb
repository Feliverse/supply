class AddContactDetailsToMarcas < ActiveRecord::Migration[7.0]
  def change
    add_column :marcas, :contact_name, :string
    add_column :marcas, :contact_number, :string
  end
end
