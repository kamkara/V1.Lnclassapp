require "test_helper"

class ResultControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get result_new_url
    assert_response :success
  end
end
