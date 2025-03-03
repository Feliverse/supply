class Sale < ApplicationRecord
  belongs_to :cliente
  belongs_to :almacen

  has_many :sale_items, dependent: :destroy
  accepts_nested_attributes_for :sale_items

  after_save :update_inventario

  def total
    sale_items.sum { |item| item.cantidad * item.precio_unitario }
  end

  private

  def update_inventario
    sale_items.each do |item|
      inventario = item.inventario
      inventario.cantidad_disponible -= item.cantidad
      inventario.save!
    end
  end
end
