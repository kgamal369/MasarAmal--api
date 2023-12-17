require "test_helper"

class MentalServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mental_service = mental_services(:one)
  end

  test "should get index" do
    get mental_services_url
    assert_response :success
  end

  test "should get new" do
    get new_mental_service_url
    assert_response :success
  end

  test "should create mental_service" do
    assert_difference("MentalService.count") do
      post mental_services_url, params: { mental_service: {  } }
    end

    assert_redirected_to mental_service_url(MentalService.last)
  end

  test "should show mental_service" do
    get mental_service_url(@mental_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_mental_service_url(@mental_service)
    assert_response :success
  end

  test "should update mental_service" do
    patch mental_service_url(@mental_service), params: { mental_service: {  } }
    assert_redirected_to mental_service_url(@mental_service)
  end

  test "should destroy mental_service" do
    assert_difference("MentalService.count", -1) do
      delete mental_service_url(@mental_service)
    end

    assert_redirected_to mental_services_url
  end
end
