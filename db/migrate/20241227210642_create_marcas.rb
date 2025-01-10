class CreateMarcas < ActiveRecord::Migration[7.0]
  def change
    create_table :marcas do |t|
      t.string :name
      t.string :logo
      t.string :contact_name
      t.string :contact_number

      t.timestamps
    end
  end
end
