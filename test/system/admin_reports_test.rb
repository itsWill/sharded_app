require "application_system_test_case"

class AdminReportsTest < ApplicationSystemTestCase
  setup do
    @admin_report = admin_reports(:one)
  end

  test "visiting the index" do
    visit admin_reports_url
    assert_selector "h1", text: "Admin Reports"
  end

  test "creating a Admin report" do
    visit admin_reports_url
    click_on "New Admin Report"

    click_on "Create Admin report"

    assert_text "Admin report was successfully created"
    click_on "Back"
  end

  test "updating a Admin report" do
    visit admin_reports_url
    click_on "Edit", match: :first

    click_on "Update Admin report"

    assert_text "Admin report was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin report" do
    visit admin_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin report was successfully destroyed"
  end
end
