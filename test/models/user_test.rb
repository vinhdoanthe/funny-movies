require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      username: "username",
      password: "password"
    )
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be unique" do
    @user.save
    user2 = User.new(username: "test")
    assert_not user2.valid?
  end

  test "username should not be too long" do
    # username must be less than 50 characters
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "username should not be too short" do
    # username must be at least 5 characters
    @user.username = "aaaa"
    assert_not @user.valid?
  end

  test "username should contain only letters and numbers" do
    # username must contain only letters and numbers
    @user.username = "abc-123"
    assert_not @user.valid?
  end


end
