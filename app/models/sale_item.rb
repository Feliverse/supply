class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product, optional: true
  belongs_to :articulo, optional: true

  validates :cantidad, presence: true
  validates :unidad_de_medida, presence: true
  validates :precio_unitario, presence: true
end
