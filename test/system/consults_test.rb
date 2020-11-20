require "application_system_test_case"

class ConsultsTest < ApplicationSystemTestCase
  setup do
    @consult = consults(:one)
  end

  test "visiting the index" do
    visit consults_url
    assert_selector "h1", text: "Consults"
  end

  test "creating a Consult" do
    visit consults_url
    click_on "New Consult"

    fill_in "Contact email", with: @consult.contact_email
    fill_in "Description", with: @consult.description
    fill_in "Meeting limit", with: @consult.meeting_limit
    fill_in "Minutes per meeting", with: @consult.minutes_per_meeting
    fill_in "Title", with: @consult.title
    fill_in "Token", with: @consult.token
    click_on "Create Consult"

    assert_text "Consult was successfully created"
    click_on "Back"
  end

  test "updating a Consult" do
    visit consults_url
    click_on "Edit", match: :first

    fill_in "Contact email", with: @consult.contact_email
    fill_in "Description", with: @consult.description
    fill_in "Meeting limit", with: @consult.meeting_limit
    fill_in "Minutes per meeting", with: @consult.minutes_per_meeting
    fill_in "Title", with: @consult.title
    fill_in "Token", with: @consult.token
    click_on "Update Consult"

    assert_text "Consult was successfully updated"
    click_on "Back"
  end

  test "destroying a Consult" do
    visit consults_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consult was successfully destroyed"
  end
end
