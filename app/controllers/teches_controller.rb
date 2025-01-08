class TechesController < ApplicationController
  before_action :set_tech, only: %i[show edit update destroy]
  before_action :set_category_and_subcategory_and_marca, only: %i[new create edit update index]

  # GET /teches or /teches.json
  def index
    @teches = @marca.teches.where(subcategory: @subcategory)
  end

  # GET /teches/1 or /teches/1.json
  def show
    @tech = Tech.find(params[:id])
    @products = @tech.products
    @marca = @tech.marca
  end

  # GET /teches/new
  def new
    @marca = Marca.find(params[:marca_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @tech = @marca.teches.build(subcategory: @subcategory)
  end

  # GET /teches/1/edit
  def edit
    @marca = @tech.marca
  end

  # POST /teches or /teches.json
  def create
    @marca = Marca.find(params[:marca_id])
    @subcategory = Subcategory.find(params[:tech][:subcategory_id])
    @tech = @marca.teches.build(tech_params.merge(subcategory: @subcategory))

    respond_to do |format|
      if @tech.save
        format.html { redirect_to category_subcategory_marca_tech_path(@category, @subcategory, @marca, @tech), notice: "Tech was successfully created." }
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
        format.html { redirect_to category_subcategory_marca_tech_path(@category, @subcategory, @marca, @tech), notice: "Tech was successfully updated." }
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
      format.html { redirect_to category_subcategory_marca_teches_path(@category, @subcategory, @marca), status: :see_other, notice: "Tech was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_tech
    @tech = Tech.find(params[:id])
  end

  def set_category_and_subcategory_and_marca
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @marca = Marca.find(params[:marca_id])
  end

  def tech_params
    params.require(:tech).permit(:name, :pieces_box, :m2_box, :marca_id, :subcategory_id)
  end
end
