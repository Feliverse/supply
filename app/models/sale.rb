class Sale < ApplicationRecord
  belongs_to :cliente
  belongs_to :almacen

  has_many :sale_items, dependent: :destroy, class_name: 'SaleItem'
  accepts_nested_attributes_for :sale_items, allow_destroy: true

  validates :fecha, presence: true

  after_create :update_inventario

  private

  def update_inventario
    inventarios = almacen.inventarios.where(product_id: sale_items.pluck(:product_id), articulo_id: sale_items.pluck(:articulo_id)).index_by { |inv| [inv.product_id, inv.articulo_id] }
    sale_items.each do |item|
      inventario = inventarios[[item.product_id, item.articulo_id]]
      inventario.with_lock do
        inventario.update!(cantidad_disponible: inventario.cantidad_disponible - item.cantidad)
      end
    end
  end
end
