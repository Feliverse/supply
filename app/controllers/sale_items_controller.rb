class SaleItemsController < ApplicationController
  before_action :set_sale_item, only: %i[ show edit update destroy ]

  def index
    @sale_items = SaleItem.all
  end

  def show
  end

  def new
    @sale_item = SaleItem.new
  end

  def edit
  end

  def create
    @sale_item = SaleItem.new(sale_item_params)

    if @sale_item.save
      redirect_to @sale_item, notice: 'Sale item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sale_item.update(sale_item_params)
      redirect_to @sale_item, notice: 'Sale item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sale_item.destroy
    redirect_to sale_items_url, notice: 'Sale item was successfully destroyed.'
  end

  private

    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    def sale_item_params
      params.require(:sale_item).permit(:sale_id, :product_id, :articulo_id, :cantidad, :unidad_de_medida, :precio_unitario)
    end
end
