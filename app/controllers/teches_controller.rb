class TechesController < ApplicationController
  before_action :set_tech, only: %i[ show edit update destroy ]

  # GET /teches or /teches.json
  def index
    @teches = Tech.all
  end

  # GET /teches/1 or /teches/1.json
  def show
    @tech = Tech.find(params[:id])
    @products = @tech.products
  end

  # GET /teches/new
  def new
    @marca = Marca.find(params[:marca_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @tech = @marca.teches.build(subcategory: @subcategory)
  end

  # GET /teches/1/edit
  def edit
  end

  # POST /teches or /teches.json
  def create
    @marca = Marca.find(params[:marca_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @tech = @marca.teches.build(tech_params.merge(subcategory: @subcategory))

    respond_to do |format|
      if @tech.save
        format.html { redirect_to [@marca, @tech], notice: "Tech was successfully created." }
        format.json { render :show, status: :created, location: @tech }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teches/1 or /teches/1.json
  def update
    respond_to do |format|
      if @tech.update(tech_params)
        format.html { redirect_to @tech, notice: "Tech was successfully updated." }
        format.json { render :show, status: :ok, location: @tech }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teches/1 or /teches/1.json
  def destroy
    @tech.destroy

    respond_to do |format|
      format.html { redirect_to teches_path, status: :see_other, notice: "Tech was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tech
      @tech = Tech.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tech_params
      params.require(:tech).permit(:format, :pieces_box, :m2_box, :tomo_calibre, :lote, :color, :marca_id, :subcategory_id)
    end
end
