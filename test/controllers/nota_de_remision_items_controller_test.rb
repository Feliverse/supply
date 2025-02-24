require "test_helper"

class NotaDeRemisionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nota_de_remision_item = nota_de_remision_items(:one)
  end

  test "should get index" do
    get nota_de_remision_items_url
    assert_response :success
  end

  test "should get new" do
    get new_nota_de_remision_item_url
    assert_response :success
  end

  test "should create nota_de_remision_item" do
    assert_difference("NotaDeRemisionItem.count") do
      post nota_de_remision_items_url, params: { nota_de_remision_item: { nota_de_remision_id: @nota_de_remision_item.nota_de_remision_id, sale_item_id: @nota_de_remision_item.sale_item_id } }
    end

    assert_redirected_to nota_de_remision_item_url(NotaDeRemisionItem.last)
  end

  test "should show nota_de_remision_item" do
    get nota_de_remision_item_url(@nota_de_remision_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_nota_de_remision_item_url(@nota_de_remision_item)
    assert_response :success
  end

  test "should update nota_de_remision_item" do
    patch nota_de_remision_item_url(@nota_de_remision_item), params: { nota_de_remision_item: { nota_de_remision_id: @nota_de_remision_item.nota_de_remision_id, sale_item_id: @nota_de_remision_item.sale_item_id } }
    assert_redirected_to nota_de_remision_item_url(@nota_de_remision_item)
  end

  test "should destroy nota_de_remision_item" do
    assert_difference("NotaDeRemisionItem.count", -1) do
      delete nota_de_remision_item_url(@nota_de_remision_item)
    end

    assert_redirected_to nota_de_remision_items_url
  end
end
