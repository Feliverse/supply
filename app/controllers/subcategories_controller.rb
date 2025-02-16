class SubcategoriesController < ApplicationController
  before_action :set_category
  before_action :set_subcategory, only: %i[ show edit update destroy ]

  # GET /subcategories or /subcategories.json
  def index
    @subcategories = @category.subcategories
  end

  # GET /subcategories/1 or /subcategories/1.json
  def show
  end

  # GET /subcategories/new
  def new
    @subcategory = @category.subcategories.build
  end

  # GET /subcategories/1/edit
  def edit
  end

  # POST /subcategories or /subcategories.json
  def create
    @subcategory = @category.subcategories.build(subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to category_subcategory_path(@category, @subcategory), notice: "Subcategoria creada." }
        format.json { render :show, status: :created, location: @subcategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcategories/1 or /subcategories/1.json
  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to category_subcategory_path(@category, @subcategory), notice: "Subcategoria actualizada." }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1 or /subcategories/1.json
  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to category_subcategories_path(@category), notice: "Subcategoria eliminada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subcategory_params
      params.require(:subcategory).permit(:name)
    end
end