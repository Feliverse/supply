class CreateTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :teches do |t|
      t.string :format
      t.integer :pieces_box
      t.decimal :m2_box
      t.string :tomo_calibre
      t.string :lote
      t.string :color
      t.references :marca, null: false, foreign_key: true

      t.timestamps
    end
  end
end
