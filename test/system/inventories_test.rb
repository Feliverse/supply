require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "should create inventory" do
    visit inventories_url
    click_on "New inventory"

    fill_in "Warehouse", with: @inventory.Warehouse
    fill_in "Generate", with: @inventory.generate
    fill_in "Location", with: @inventory.location
    fill_in "Name", with: @inventory.name
    fill_in "Rails", with: @inventory.rails
    fill_in "Scaffold", with: @inventory.scaffold
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "should update Inventory" do
    visit inventory_url(@inventory)
    click_on "Edit this inventory", match: :first

    fill_in "Warehouse", with: @inventory.Warehouse
    fill_in "Generate", with: @inventory.generate
    fill_in "Location", with: @inventory.location
    fill_in "Name", with: @inventory.name
    fill_in "Rails", with: @inventory.rails
    fill_in "Scaffold", with: @inventory.scaffold
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory" do
    visit inventory_url(@inventory)
    click_on "Destroy this inventory", match: :first

    assert_text "Inventory was successfully destroyed"
  end
end
