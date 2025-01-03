class SubcategoriesController < ApplicationController
  before_action :set_category
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  def index
    @subcategories = @category.subcategories
  end

  def show
  end

  def new
    @subcategory = @category.subcategories.build
  end

  def create
    @subcategory = @category.subcategories.build(subcategory_params)
    if @subcategory.save
      redirect_to category_subcategory_path(@category, @subcategory), notice: 'Subcategory was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subcategory.update(subcategory_params)
      redirect_to category_subcategory_path(@category, @subcategory), notice: 'Subcategory was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @subcategory.destroy
    redirect_to category_subcategories_path(@category), notice: 'Subcategory was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_subcategory
    @subcategory = @category.subcategories.find(params[:id])
  end

  def subcategory_params
    params.require(:subcategory).permit(:name, :description)
  end
end