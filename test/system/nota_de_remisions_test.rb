require "application_system_test_case"

class NotaDeRemisionsTest < ApplicationSystemTestCase
  setup do
    @nota_de_remision = nota_de_remisions(:one)
  end

  test "visiting the index" do
    visit nota_de_remisions_url
    assert_selector "h1", text: "Nota de remisions"
  end

  test "should create nota de remision" do
    visit nota_de_remisions_url
    click_on "New nota de remision"

    fill_in "Fecha", with: @nota_de_remision.fecha
    fill_in "Sale", with: @nota_de_remision.sale_id
    click_on "Create Nota de remision"

    assert_text "Nota de remision was successfully created"
    click_on "Back"
  end

  test "should update Nota de remision" do
    visit nota_de_remision_url(@nota_de_remision)
    click_on "Edit this nota de remision", match: :first

    fill_in "Fecha", with: @nota_de_remision.fecha
    fill_in "Sale", with: @nota_de_remision.sale_id
    click_on "Update Nota de remision"

    assert_text "Nota de remision was successfully updated"
    click_on "Back"
  end

  test "should destroy Nota de remision" do
    visit nota_de_remision_url(@nota_de_remision)
    click_on "Destroy this nota de remision", match: :first

    assert_text "Nota de remision was successfully destroyed"
  end
end
