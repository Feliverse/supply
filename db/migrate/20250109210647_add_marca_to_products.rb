class AddMarcaToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :marca, foreign_key: true
  end
end
