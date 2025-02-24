class NotaDeRemisionsController < ApplicationController
  before_action :set_nota_de_remision, only: %i[ show edit update destroy ]

  # GET /nota_de_remisions or /nota_de_remisions.json
  def index
    @nota_de_remisions = NotaDeRemision.all
  end

  # GET /nota_de_remisions/1 or /nota_de_remisions/1.json
  def show
  end

  # GET /nota_de_remisions/new
  def new
    @nota_de_remision = NotaDeRemision.new(sale: @sale)
    @sale.sale_items.each do |sale_item|
      @nota_de_remision.nota_de_remision_items.build(sale_item: sale_item)
    end
  end

  # GET /nota_de_remisions/1/edit
  def edit
  end

  # POST /nota_de_remisions or /nota_de_remisions.json
  def create
    @nota_de_remision = NotaDeRemision.new(nota_de_remision_params)
    @nota_de_remision.sale = @sale

    respond_to do |format|
      if @nota_de_remision.save
        format.html { redirect_to @nota_de_remision, notice: "Nota de remision was successfully created." }
        format.json { render :show, status: :created, location: @nota_de_remision }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nota_de_remision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota_de_remisions/1 or /nota_de_remisions/1.json
  def update
    respond_to do |format|
      if @nota_de_remision.update(nota_de_remision_params)
        format.html { redirect_to @nota_de_remision, notice: "Nota de remision was successfully updated." }
        format.json { render :show, status: :ok, location: @nota_de_remision }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nota_de_remision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_de_remisions/1 or /nota_de_remisions/1.json
  def destroy
    @nota_de_remision.destroy

    respond_to do |format|
      format.html { redirect_to nota_de_remisions_path, status: :see_other, notice: "Nota de remision was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota_de_remision
      @nota_de_remision = NotaDeRemision.find(params[:id])
    end

    def set_sale
      @sale = Sale.find(params[:sale_id])
    end

    # Only allow a list of trusted parameters through.
    def nota_de_remision_params
      params.require(:nota_de_remision).permit(:fecha, nota_de_remision_items_attributes: [:sale_item_id])
    end
end
