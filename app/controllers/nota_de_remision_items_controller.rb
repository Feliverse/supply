class NotaDeRemisionItemsController < ApplicationController
  before_action :set_nota_de_remision_item, only: %i[ show edit update destroy ]

  # GET /nota_de_remision_items or /nota_de_remision_items.json
  def index
    @nota_de_remision_items = NotaDeRemisionItem.all
  end

  # GET /nota_de_remision_items/1 or /nota_de_remision_items/1.json
  def show
  end

  # GET /nota_de_remision_items/new
  def new
    @nota_de_remision_item = NotaDeRemisionItem.new
  end

  # GET /nota_de_remision_items/1/edit
  def edit
  end

  # POST /nota_de_remision_items or /nota_de_remision_items.json
  def create
    @nota_de_remision_item = NotaDeRemisionItem.new(nota_de_remision_item_params)

    respond_to do |format|
      if @nota_de_remision_item.save
        format.html { redirect_to @nota_de_remision_item, notice: "Nota de remision item was successfully created." }
        format.json { render :show, status: :created, location: @nota_de_remision_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nota_de_remision_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota_de_remision_items/1 or /nota_de_remision_items/1.json
  def update
    respond_to do |format|
      if @nota_de_remision_item.update(nota_de_remision_item_params)
        format.html { redirect_to @nota_de_remision_item, notice: "Nota de remision item was successfully updated." }
        format.json { render :show, status: :ok, location: @nota_de_remision_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nota_de_remision_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_de_remision_items/1 or /nota_de_remision_items/1.json
  def destroy
    @nota_de_remision_item.destroy

    respond_to do |format|
      format.html { redirect_to nota_de_remision_items_path, status: :see_other, notice: "Nota de remision item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota_de_remision_item
      @nota_de_remision_item = NotaDeRemisionItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nota_de_remision_item_params
      params.require(:nota_de_remision_item).permit(:nota_de_remision_id, :sale_item_id)
    end
end
