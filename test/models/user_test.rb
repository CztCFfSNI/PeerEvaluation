require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: "user@example.com",
    encrypted_password: "foobar")
    end

    test "password should be present (nonblank)" do
      @user.encrypted_password = " " * 6
      assert_not @user.valid?
      end
  
  test "password should have a minimum length" do
    @user.encrypted_password = "a" * 5
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "m" * 51
    assert_not @user.valid?
    end

    test "email should be present" do
      @user.email = ""
      assert_not @user.valid?
    end

    test "invalid email" do
      @user.email = "student@@.com"
      assert_not @user.valid?
    end

    




  
end
