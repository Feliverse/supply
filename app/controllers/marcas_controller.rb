class MarcasController < ApplicationController
  before_action :set_marca, only: %i[ show edit update destroy ]
  before_action :set_subcategory

  # GET /marcas or /marcas.json
  def index
    @marcas = @subcategory.marcas
  end

  # GET /marcas/1 or /marcas/1.json
  def show
    @teches = @marca.teches
  end

  # GET /marcas/new
  def new
    @marca = @subcategory.marcas.build
  end

  # GET /marcas/1/edit
  def edit
  end

  # POST /marcas or /marcas.json
  def create
    @marca = @subcategory.marcas.build(marca_params)

    respond_to do |format|
      if @marca.save
        format.html { redirect_to category_subcategory_marca_path(@subcategory.category, @subcategory, @marca), notice: "Marca was successfully created." }
        format.json { render :show, status: :created, location: @marca }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marcas/1 or /marcas/1.json
  def update
    respond_to do |format|
      if @marca.update(marca_params)
        format.html { redirect_to category_subcategory_marca_path(@subcategory.category, @subcategory, @marca), notice: "Marca was successfully updated." }
        format.json { render :show, status: :ok, location: @marca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marcas/1 or /marcas/1.json
  def destroy
    @marca.destroy

    respond_to do |format|
      format.html { redirect_to category_subcategory_marcas_path(@subcategory.category, @subcategory), status: :see_other, notice: "Marca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca
      @marca = Marca.find(params[:id])
    end

    def set_subcategory
      @subcategory = Subcategory.find(params[:subcategory_id])
    end

    # Only allow a list of trusted parameters through.
    def marca_params
      params.require(:marca).permit(:name, :subcategory_id, :logo, :contact_name, :contact_number)
    end
end
