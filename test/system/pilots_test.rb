require "application_system_test_case"

class PilotsTest < ApplicationSystemTestCase
  setup do
    @pilot = pilots(:one)
  end

  test "visiting the index" do
    visit pilots_url
    assert_selector "h1", text: "Pilots"
  end

  test "should create pilot" do
    visit pilots_url
    click_on "New pilot"

    fill_in "Document", with: @pilot.document
    fill_in "Name", with: @pilot.name
    click_on "Create Pilot"

    assert_text "Pilot was successfully created"
    click_on "Back"
  end

  test "should update Pilot" do
    visit pilot_url(@pilot)
    click_on "Edit this pilot", match: :first

    fill_in "Document", with: @pilot.document
    fill_in "Name", with: @pilot.name
    click_on "Update Pilot"

    assert_text "Pilot was successfully updated"
    click_on "Back"
  end

  test "should destroy Pilot" do
    visit pilot_url(@pilot)
    click_on "Destroy this pilot", match: :first

    assert_text "Pilot was successfully destroyed"
  end
end
