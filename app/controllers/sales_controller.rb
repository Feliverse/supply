class SalesController < ApplicationController
  before_action :set_almacen

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = @almacen.sales.build(sale_params)
    @sale.fecha = Time.now

    if @sale.save
      update_inventory(@sale)
      redirect_to sales_path, notice: 'Venta creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def set_almacen
      @almacen = Almacen.find(params[:almacen_id])
    end

    def sale_params
      params.require(:sale).permit(:almacen_id, :cliente_id, cantidades: [], units: [], descriptions: [], unit_prices: [], totals: [])
    end

    def update_inventory(sale)
      sale.cantidades.each_with_index do |cantidad, index|
        description = sale.descriptions[index]
        unidad_de_medida = sale.units[index]
        precio_unitario = sale.unit_prices[index]
        inventario = @almacen.inventarios.joins(:product, :articulo).find_by("products.name = ? OR articulos.name = ?", description, description)
        if inventario
          inventario.update(cantidad_disponible: inventario.cantidad_disponible - cantidad.to_i)
        else
          # Handle the case where the inventory item is not found
          Rails.logger.warn "Inventory item not found for description: #{description}"
        end
      end
    end
end
