require "application_system_test_case"

class MentalServicesTest < ApplicationSystemTestCase
  setup do
    @mental_service = mental_services(:one)
  end

  test "visiting the index" do
    visit mental_services_url
    assert_selector "h1", text: "Mental services"
  end

  test "should create mental service" do
    visit mental_services_url
    click_on "New mental service"

    click_on "Create Mental service"

    assert_text "Mental service was successfully created"
    click_on "Back"
  end

  test "should update Mental service" do
    visit mental_service_url(@mental_service)
    click_on "Edit this mental service", match: :first

    click_on "Update Mental service"

    assert_text "Mental service was successfully updated"
    click_on "Back"
  end

  test "should destroy Mental service" do
    visit mental_service_url(@mental_service)
    click_on "Destroy this mental service", match: :first

    assert_text "Mental service was successfully destroyed"
  end
end
