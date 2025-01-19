class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @almacen = Almacen.find(params[:almacen_id])
    @sale = Sale.new
  end

  def create
    @almacen = Almacen.find(params[:almacen_id])
    @sale = @almacen.sales.build(sale_params)

    if @sale.save
      update_inventory(@sale)
      redirect_to sales_path, notice: 'Venta creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:client_nit, :client_name, quantities: [], units: [], descriptions: [], unit_prices: [], totals: [])
  end

  def update_inventory(sale)
    sale.quantities.each_with_index do |quantity, index|
      product = @almacen.products.find_by(description: sale.descriptions[index])
      product.update(quantity: product.quantity - quantity.to_i)
    end
  end
end
