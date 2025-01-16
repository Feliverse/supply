require "application_system_test_case"

class CalidadsTest < ApplicationSystemTestCase
  setup do
    @calidad = calidads(:one)
  end

  test "visiting the index" do
    visit calidads_url
    assert_selector "h1", text: "Calidads"
  end

  test "should create calidad" do
    visit calidads_url
    click_on "New calidad"

    fill_in "Name", with: @calidad.name
    click_on "Create Calidad"

    assert_text "Calidad was successfully created"
    click_on "Back"
  end

  test "should update Calidad" do
    visit calidad_url(@calidad)
    click_on "Edit this calidad", match: :first

    fill_in "Name", with: @calidad.name
    click_on "Update Calidad"

    assert_text "Calidad was successfully updated"
    click_on "Back"
  end

  test "should destroy Calidad" do
    visit calidad_url(@calidad)
    click_on "Destroy this calidad", match: :first

    assert_text "Calidad was successfully destroyed"
  end
end
