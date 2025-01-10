class TechesController < ApplicationController
  before_action :set_tech, only: %i[show edit update destroy]
  before_action :set_marca

  # GET /teches or /teches.json
  def index
    @teches = @marca.teches
  end

  # GET /teches/1 or /teches/1.json
  def show
  end

  # GET /teches/new
  def new
    @tech = @marca.teches.build
  end

  # GET /teches/1/edit
  def edit
  end

  # POST /teches or /teches.json
  def create
    @tech = @marca.teches.build(tech_params)

    respond_to do |format|
      if @tech.save
        format.html { redirect_to marca_tech_path(@marca, @tech), notice: "Tech was successfully created." }
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
        format.html { redirect_to marca_tech_path(@marca, @tech), notice: "Tech was successfully updated." }
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
      format.html { redirect_to marca_teches_path(@marca), status: :see_other, notice: "Tech was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_tech
    @tech = Tech.find(params[:id])
  end

  def set_marca
    @marca = Marca.find(params[:marca_id])
  end

  def tech_params
    params.require(:tech).permit(:name, :pieces_box, :m2_box, :marca_id)
  end
end
