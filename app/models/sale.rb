class Sale < ApplicationRecord
  belongs_to :cliente
  belongs_to :almacen

  has_many :sale_items, dependent: :destroy
  accepts_nested_attributes_for :sale_items, allow_destroy: true

  validates :fecha, presence: true

  after_create :update_inventario

  private

  def update_inventario
    sale_items.each do |item|
      inventario = almacen.inventarios.find_by(product_id: item.product_id, articulo_id: item.articulo_id)
      if inventario
        inventario.update(cantidad_disponible: inventario.cantidad_disponible - item.cantidad)
      end
    end
  end
end

class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product, optional: true
  belongs_to :articulo, optional: true

  validates :cantidad, presence: true, numericality: { greater_than: 0 }
  validates :unidad_de_medida, presence: true
  validates :precio_unitario, presence: true, numericality: { greater_than: 0 }
end
