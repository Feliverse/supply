require "application_system_test_case"

class TechesTest < ApplicationSystemTestCase
  setup do
    @tech = teches(:one)
  end

  test "visiting the index" do
    visit teches_url
    assert_selector "h1", text: "Teches"
  end

  test "should create tech" do
    visit teches_url
    click_on "New tech"

    fill_in "Color", with: @tech.color
    fill_in "Format", with: @tech.format
    fill_in "Lote", with: @tech.lote
    fill_in "M2 box", with: @tech.m2_box
    fill_in "Marca", with: @tech.marca_id
    fill_in "Pieces box", with: @tech.pieces_box
    fill_in "Tomo calibre", with: @tech.tomo_calibre
    click_on "Create Tech"

    assert_text "Tech was successfully created"
    click_on "Back"
  end

  test "should update Tech" do
    visit tech_url(@tech)
    click_on "Edit this tech", match: :first

    fill_in "Color", with: @tech.color
    fill_in "Format", with: @tech.format
    fill_in "Lote", with: @tech.lote
    fill_in "M2 box", with: @tech.m2_box
    fill_in "Marca", with: @tech.marca_id
    fill_in "Pieces box", with: @tech.pieces_box
    fill_in "Tomo calibre", with: @tech.tomo_calibre
    click_on "Update Tech"

    assert_text "Tech was successfully updated"
    click_on "Back"
  end

  test "should destroy Tech" do
    visit tech_url(@tech)
    click_on "Destroy this tech", match: :first

    assert_text "Tech was successfully destroyed"
  end
end
