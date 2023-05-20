require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get export" do
    get users_export_url
    assert_response :success
  end
end
