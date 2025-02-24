class NotaDeRemision < ApplicationRecord
  belongs_to :sale
  has_many :nota_de_remision_items, dependent: :destroy
  has_many :sale_items, through: :nota_de_remision_items

  accepts_nested_attributes_for :nota_de_remision_items, allow_destroy: true

  after_save :update_inventario

  private

  def update_inventario
    nota_de_remision_items.each do |item|
      inventario = item.sale_item.inventario
      inventario.cantidad_disponible -= item.sale_item.cantidad
      inventario.save!
    end
  end
end
