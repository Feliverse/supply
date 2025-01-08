class ModifyTeches < ActiveRecord::Migration[7.0]
  def change
    remove_column :teches, :lote, :string
    remove_column :teches, :color, :string
    remove_column :teches, :tomo_calibre, :string
    rename_column :teches, :format, :name
  end
end
