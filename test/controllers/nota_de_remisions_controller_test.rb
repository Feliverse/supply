require "test_helper"

class NotaDeRemisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nota_de_remision = nota_de_remisions(:one)
  end

  test "should get index" do
    get nota_de_remisions_url
    assert_response :success
  end

  test "should get new" do
    get new_nota_de_remision_url
    assert_response :success
  end

  test "should create nota_de_remision" do
    assert_difference("NotaDeRemision.count") do
      post nota_de_remisions_url, params: { nota_de_remision: { fecha: @nota_de_remision.fecha, sale_id: @nota_de_remision.sale_id } }
    end

    assert_redirected_to nota_de_remision_url(NotaDeRemision.last)
  end

  test "should show nota_de_remision" do
    get nota_de_remision_url(@nota_de_remision)
    assert_response :success
  end

  test "should get edit" do
    get edit_nota_de_remision_url(@nota_de_remision)
    assert_response :success
  end

  test "should update nota_de_remision" do
    patch nota_de_remision_url(@nota_de_remision), params: { nota_de_remision: { fecha: @nota_de_remision.fecha, sale_id: @nota_de_remision.sale_id } }
    assert_redirected_to nota_de_remision_url(@nota_de_remision)
  end

  test "should destroy nota_de_remision" do
    assert_difference("NotaDeRemision.count", -1) do
      delete nota_de_remision_url(@nota_de_remision)
    end

    assert_redirected_to nota_de_remisions_url
  end
end
