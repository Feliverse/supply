require "test_helper"

class InventariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventario = inventarios(:one)
  end

  test "should get index" do
    get inventarios_url
    assert_response :success
  end

  test "should get new" do
    get new_inventario_url
    assert_response :success
  end

  test "should create inventario" do
    assert_difference("Inventario.count") do
      post inventarios_url, params: { inventario: { almacen_id: @inventario.almacen_id, articulo_id: @inventario.articulo_id, cantidad_disponible: @inventario.cantidad_disponible, fecha_actualizacion: @inventario.fecha_actualizacion, product_id: @inventario.product_id } }
    end

    assert_redirected_to inventario_url(Inventario.last)
  end

  test "should show inventario" do
    get inventario_url(@inventario)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventario_url(@inventario)
    assert_response :success
  end

  test "should update inventario" do
    patch inventario_url(@inventario), params: { inventario: { almacen_id: @inventario.almacen_id, articulo_id: @inventario.articulo_id, cantidad_disponible: @inventario.cantidad_disponible, fecha_actualizacion: @inventario.fecha_actualizacion, product_id: @inventario.product_id } }
    assert_redirected_to inventario_url(@inventario)
  end

  test "should destroy inventario" do
    assert_difference("Inventario.count", -1) do
      delete inventario_url(@inventario)
    end

    assert_redirected_to inventarios_url
  end
end
