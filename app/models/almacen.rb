class Almacen < ApplicationRecord
  has_many :movimientos, class_name: 'Movimiento'
  has_many :inventarios, class_name: 'Inventario'
  has_many :sales, class_name: 'Sale'

  validates :name, presence: true

  def registrar_ingreso(product_o_articulo, cantidad, tipo_movimiento, fecha = Time.now)
    movimiento = movimientos.create!(
      tipo: 'Ingreso',
      cantidad: cantidad,
      fecha: fecha,
      almacen: self,
      product: product_o_articulo.is_a?(Product) ? product_o_articulo : nil,
      articulo: product_o_articulo.is_a?(Articulo) ? product_o_articulo : nil
    )

    inventario = inventarios.find_or_initialize_by(
      product: product_o_articulo.is_a?(Product) ? product_o_articulo : nil,
      articulo: product_o_articulo.is_a?(Articulo) ? product_o_articulo : nil
    )
    inventario.cantidad_disponible ||= 0
    inventario.cantidad_disponible += cantidad
    inventario.fecha_actualizacion = fecha
    inventario.save!
  end

  def registrar_salida(product_o_articulo, cantidad, tipo_movimiento, fecha = Time.now)
    inventario = inventarios.find_by(
      product: product_o_articulo.is_a?(Product) ? product_o_articulo : nil,
      articulo: product_o_articulo.is_a?(Articulo) ? product_o_articulo : nil
    )

    raise "No hay suficiente inventario disponible" if inventario.nil? || inventario.cantidad_disponible < cantidad

    movimiento = movimientos.create!(
      tipo: 'Salida',
      cantidad: cantidad,
      fecha: fecha,
      almacen: self,
      product: product_o_articulo.is_a?(Product) ? product_o_articulo : nil,
      articulo: product_o_articulo.is_a?(Articulo) ? product_o_articulo : nil
    )

    inventario.cantidad_disponible -= cantidad
    inventario.fecha_actualizacion = fecha
    inventario.save!
  end

  def traspasar(product_o_articulo, cantidad, almacen_destino, fecha = Time.now)
    ActiveRecord::Base.transaction do
      registrar_salida(product_o_articulo, cantidad, 'Salida por traspaso', fecha)
      almacen_destino.registrar_ingreso(product_o_articulo, cantidad, 'Ingreso por traspaso', fecha)
    end
  end

  def registrar_venta(cliente, product_o_articulo, cantidad, fecha = Time.now)
    ActiveRecord::Base.transaction do
      registrar_salida(product_o_articulo, cantidad, 'Salida por venta', fecha)
      sales.create!(
        cliente: cliente,
        fecha: fecha,
        cantidad: cantidad,
        almacen: self,
        product: product_o_articulo.is_a?(Product) ? product_o_articulo : nil,
        articulo: product_o_articulo.is_a?(Articulo) ? product_o_articulo : nil
      )
    end
  end
end
