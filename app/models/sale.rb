class Sale < ApplicationRecord
  belongs_to :cliente
  belongs_to :almacen
  belongs_to :product, optional: true
  belongs_to :articulo, optional: true

  validates :fecha, presence: true
  validates :cantidad, presence: true, numericality: { greater_than: 0 }

  # Define virtual attributes for nested fields
  attr_accessor :quantities, :units, :descriptions, :unit_prices, :totals

  after_create :update_inventario

  private

  def update_inventario
    quantities.each_with_index do |quantity, index|
      description = descriptions[index]
      inventario = almacen.inventarios.find_by(product: product, articulo: articulo)
      if inventario
        inventario.update(cantidad_disponible: inventario.cantidad_disponible - quantity.to_i)
      end
    end
  end
end
