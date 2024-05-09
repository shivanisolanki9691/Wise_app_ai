require "test_helper"

class WiseAppsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wise_apps_index_url
    assert_response :success
  end
end
