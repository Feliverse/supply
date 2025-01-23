class Sale < ApplicationRecord
  belongs_to :cliente
  belongs_to :almacen

  validates :fecha, presence: true
  validates :cantidad, presence: true, numericality: { greater_than: 0 }
  validates :unidad_de_medida, presence: true
  validates :precio_unitario, presence: true, numericality: { greater_than: 0 }

  # Define virtual attributes for nested fields
  attr_accessor :cantidades, :units, :descriptions, :unit_prices, :totals

  after_create :update_inventario

  private

  def update_inventario
    self.cantidades ||= []
    self.units ||= []
    self.unit_prices ||= []
    self.descriptions ||= []
    cantidades.each_with_index do |cantidad, index|
      description = descriptions[index]
      unidad_de_medida = units[index]
      precio_unitario = unit_prices[index]
      inventario = almacen.inventarios.joins(:product, :articulo).find_by("products.name = ? OR articulos.name = ?", description, description)
      if inventario
        inventario.update(cantidad_disponible: inventario.cantidad_disponible - cantidad.to_i)
      end
    end
  end
end
