class Inventario < ApplicationRecord
  belongs_to :almacen
  belongs_to :product, optional: true
  belongs_to :articulo, optional: true
  has_many :sale_items

  validates :cantidad_disponible, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fecha_actualizacion, presence: true

  def name_with_quantity
    item_name = product&.name || articulo&.name
    "#{item_name} - #{cantidad_disponible} disponibles"
  end
end
