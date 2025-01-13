class Movimiento < ApplicationRecord
  belongs_to :almacen
  belongs_to :product, optional: true
  belongs_to :articulo, optional: true

  validates :tipo, presence: true, inclusion: { in: %w[Ingreso Salida] }
  validates :cantidad, presence: true, numericality: { greater_than: 0 }
  validates :fecha, presence: true
end
