class CreateNotaDeRemisions < ActiveRecord::Migration[7.0]
  def change
    create_table :nota_de_remisions do |t|
      t.references :sale, null: false, foreign_key: true
      t.datetime :fecha

      t.timestamps
    end
  end
end
