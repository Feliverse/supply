class Inventario < ApplicationRecord
  belongs_to :almacen
  belongs_to :product, optional: true
  belongs_to :articulo, optional: true
  has_many :sale_items

  validates :cantidad_disponible, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fecha_actualizacion, presence: true
end
