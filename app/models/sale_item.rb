class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :inventario

  validates :cantidad, presence: true
  validates :unidad_de_medida, presence: true
  validates :precio_unitario, presence: true
end
