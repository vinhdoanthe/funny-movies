require "test_helper"

class RegisterOrLoginTest < ActionDispatch::IntegrationTest
  test "register or login" do
    # User register or login
    # if successfully, user will be redirected to movies page
    #
    post sign_in_path, params: {
      username: 'testusername',
      password: 'testpassword'
    }

    assert_response :redirect
    assert_match response.redirect_url, movies_url
    follow_redirect!
    assert_response :success
    assert_match 'successfully', response.body

  end
end
