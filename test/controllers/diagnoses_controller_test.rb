require "test_helper"

class DiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get diagnoses_start_url
    assert_response :success
  end

  test "should get question" do
    get diagnoses_question_url
    assert_response :success
  end

  test "should get result" do
    get diagnoses_result_url
    assert_response :success
  end
end
