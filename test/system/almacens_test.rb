require "application_system_test_case"

class AlmacensTest < ApplicationSystemTestCase
  setup do
    @almacen = almacens(:one)
  end

  test "visiting the index" do
    visit almacens_url
    assert_selector "h1", text: "Almacens"
  end

  test "should create almacen" do
    visit almacens_url
    click_on "New almacen"

    fill_in "Name", with: @almacen.name
    click_on "Create Almacen"

    assert_text "Almacen was successfully created"
    click_on "Back"
  end

  test "should update Almacen" do
    visit almacen_url(@almacen)
    click_on "Edit this almacen", match: :first

    fill_in "Name", with: @almacen.name
    click_on "Update Almacen"

    assert_text "Almacen was successfully updated"
    click_on "Back"
  end

  test "should destroy Almacen" do
    visit almacen_url(@almacen)
    click_on "Destroy this almacen", match: :first

    assert_text "Almacen was successfully destroyed"
  end
end
