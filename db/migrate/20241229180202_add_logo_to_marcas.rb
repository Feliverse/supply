class AddLogoToMarcas < ActiveRecord::Migration[6.1]
  def change
    add_column :marcas, :logo, :string
  end
end
