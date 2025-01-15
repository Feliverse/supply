class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to sales_path, notice: 'Venta creada exitosamente.'
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:client_nit, :client_name, :other_sale_attributes)
  end
end
