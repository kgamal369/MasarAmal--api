require "test_helper"

class TreatmentApproachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment_approach = treatment_approaches(:one)
  end

  test "should get index" do
    get treatment_approaches_url
    assert_response :success
  end

  test "should get new" do
    get new_treatment_approach_url
    assert_response :success
  end

  test "should create treatment_approach" do
    assert_difference("TreatmentApproach.count") do
      post treatment_approaches_url, params: { treatment_approach: {  } }
    end

    assert_redirected_to treatment_approach_url(TreatmentApproach.last)
  end

  test "should show treatment_approach" do
    get treatment_approach_url(@treatment_approach)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatment_approach_url(@treatment_approach)
    assert_response :success
  end

  test "should update treatment_approach" do
    patch treatment_approach_url(@treatment_approach), params: { treatment_approach: {  } }
    assert_redirected_to treatment_approach_url(@treatment_approach)
  end

  test "should destroy treatment_approach" do
    assert_difference("TreatmentApproach.count", -1) do
      delete treatment_approach_url(@treatment_approach)
    end

    assert_redirected_to treatment_approaches_url
  end
end
