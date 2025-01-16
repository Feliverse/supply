class CalidadsController < ApplicationController
  before_action :set_calidad, only: %i[ show edit update destroy ]

  # GET /calidads or /calidads.json
  def index
    @calidads = Calidad.all
  end

  # GET /calidads/1 or /calidads/1.json
  def show
  end

  # GET /calidads/new
  def new
    @calidad = Calidad.new
  end

  # GET /calidads/1/edit
  def edit
  end

  # POST /calidads or /calidads.json
  def create
    @calidad = Calidad.new(calidad_params)

    respond_to do |format|
      if @calidad.save
        format.html { redirect_to @calidad, notice: "Calidad was successfully created." }
        format.json { render :show, status: :created, location: @calidad }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calidads/1 or /calidads/1.json
  def update
    respond_to do |format|
      if @calidad.update(calidad_params)
        format.html { redirect_to @calidad, notice: "Calidad was successfully updated." }
        format.json { render :show, status: :ok, location: @calidad }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calidads/1 or /calidads/1.json
  def destroy
    @calidad.destroy

    respond_to do |format|
      format.html { redirect_to calidads_path, status: :see_other, notice: "Calidad was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calidad
      @calidad = Calidad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calidad_params
      params.require(:calidad).permit(:name)
    end
end
