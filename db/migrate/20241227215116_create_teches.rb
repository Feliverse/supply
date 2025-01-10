class CreateTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :teches do |t|
      t.string :format
      t.integer :pieces_box
      t.decimal :m2_box
      t.references :marca, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
