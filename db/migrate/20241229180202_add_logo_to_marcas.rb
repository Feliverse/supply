class AddLogoToMarcas < ActiveRecord::Migration[7.0]
  def change
    add_column :marcas, :logo, :string
  end
end
