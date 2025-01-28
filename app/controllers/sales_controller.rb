class SalesController < ApplicationController
  before_action :set_almacen

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.fecha = Time.now
    @sale.almacen = @almacen
    @sale.cliente_id = params[:sale][:cliente_id]

    if @sale.save
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
      params.require(:sale).permit(:cliente_id, sale_items_attributes: [:product_id, :articulo_id, :cantidad, :unidad_de_medida, :precio_unitario])
    end
end
