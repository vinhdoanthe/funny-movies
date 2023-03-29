require "test_helper"

class RegisterOrLoginTest < ActionDispatch::IntegrationTest
  test "register or login" do
    post sign_in_path, params: {
      username: 'testusername',
      password: 'testpassword'
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
