class AlmacensController < ApplicationController
  before_action :set_almacen, only: %i[ show edit update destroy new_movimiento_producto new_movimiento_articulo create_movimiento ]

  # GET /almacens or /almacens.json
  def index
    @almacens = Almacen.all
  end

  # GET /almacens/1 or /almacens/1.json
  def show
    @almacen = Almacen.find(params[:id])
    @inventarios = @almacen.inventarios
  end

  # GET /almacens/new
  def new
    @almacen = Almacen.new
  end

  # GET /almacens/1/edit
  def edit
  end

  def new_movimiento_producto
    @movimiento = Movimiento.new
  end

  def new_movimiento_articulo
    @movimiento = Movimiento.new
  end

  def create_movimiento
    @movimiento = @almacen.movimientos.build(movimiento_params)

    if @movimiento.save
      producto_o_articulo = @movimiento.product || @movimiento.articulo
      @almacen.registrar_ingreso(producto_o_articulo, @movimiento.cantidad, @movimiento.tipo, @movimiento.fecha)
      redirect_to @almacen, notice: "Movimiento registrado exitosamente."
    else
      render action: @movimiento.product ? :new_movimiento_producto : :new_movimiento_articulo
    end
  end

  # POST /almacens or /almacens.json
  def create
    @almacen = Almacen.new(almacen_params)

    respond_to do |format|
      if @almacen.save
        format.html { redirect_to @almacen, notice: "Almacen was successfully created." }
        format.json { render :show, status: :created, location: @almacen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @almacen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /almacens/1 or /almacens/1.json
  def update
    respond_to do |format|
      if @almacen.update(almacen_params)
        format.html { redirect_to @almacen, notice: "Almacen was successfully updated." }
        format.json { render :show, status: :ok, location: @almacen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @almacen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /almacens/1 or /almacens/1.json
  def destroy
    @almacen.destroy

    respond_to do |format|
      format.html { redirect_to almacens_path, status: :see_other, notice: "Almacen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_almacen
      @almacen = Almacen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def almacen_params
      params.require(:almacen).permit(:name)
    end

    def movimiento_params
      params.require(:movimiento).permit(:tipo, :cantidad, :fecha, :product_id, :articulo_id)
    end
end
