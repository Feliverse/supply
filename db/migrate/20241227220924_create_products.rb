class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :tonocalibre
      t.bigint :subcategory_id
      t.bigint :marca_id

      t.references :tech, null: false, foreign_key: true
      t.references :calidad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
