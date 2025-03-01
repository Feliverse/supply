class SalesController < ApplicationController
  before_action :set_almacen, only: %i[new create]
  before_action :set_sale, only: %i[show edit update destroy]

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @sale.sale_items.build
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.fecha = Time.now
    @sale.almacen = @almacen
    @sale.cliente_id = sale_params[:cliente_id]

    if @sale.save
      redirect_to @sale, notice: 'Sale was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sale.update(sale_params)
      redirect_to @sale, notice: 'Sale was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_almacen
      @almacen = Almacen.find(params[:almacen_id])
    end

    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:cliente_id, sale_items_attributes: [:id, :inventario_id, :cantidad, :unidad_de_medida, :precio_unitario, :_destroy])
    end
end
