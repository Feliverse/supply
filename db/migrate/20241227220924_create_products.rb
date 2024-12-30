class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.references :marca, null: false, foreign_key: true
      t.references :tech, null: false, foreign_key: true

      t.timestamps
    end
  end
end
