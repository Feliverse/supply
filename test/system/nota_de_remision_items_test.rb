require "application_system_test_case"

class NotaDeRemisionItemsTest < ApplicationSystemTestCase
  setup do
    @nota_de_remision_item = nota_de_remision_items(:one)
  end

  test "visiting the index" do
    visit nota_de_remision_items_url
    assert_selector "h1", text: "Nota de remision items"
  end

  test "should create nota de remision item" do
    visit nota_de_remision_items_url
    click_on "New nota de remision item"

    fill_in "Nota de remision", with: @nota_de_remision_item.nota_de_remision_id
    fill_in "Sale item", with: @nota_de_remision_item.sale_item_id
    click_on "Create Nota de remision item"

    assert_text "Nota de remision item was successfully created"
    click_on "Back"
  end

  test "should update Nota de remision item" do
    visit nota_de_remision_item_url(@nota_de_remision_item)
    click_on "Edit this nota de remision item", match: :first

    fill_in "Nota de remision", with: @nota_de_remision_item.nota_de_remision_id
    fill_in "Sale item", with: @nota_de_remision_item.sale_item_id
    click_on "Update Nota de remision item"

    assert_text "Nota de remision item was successfully updated"
    click_on "Back"
  end

  test "should destroy Nota de remision item" do
    visit nota_de_remision_item_url(@nota_de_remision_item)
    click_on "Destroy this nota de remision item", match: :first

    assert_text "Nota de remision item was successfully destroyed"
  end
end
