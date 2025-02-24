class CreateNotaDeRemisionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :nota_de_remision_items do |t|
      t.references :nota_de_remision, null: false, foreign_key: true
      t.references :sale_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
