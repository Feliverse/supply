class Sale < ApplicationRecord
  belongs_to :cliente
  belongs_to :almacen
  belongs_to :product, optional: true
  belongs_to :articulo, optional: true

  validates :fecha, presence: true
  validates :cantidad, presence: true, numericality: { greater_than: 0 }
end
