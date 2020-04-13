require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email:"user@example.com",
      password: "foobar", password_confirmation: "foobar")
  end



   test "should be valid" do
     assert @user.valid?
   end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "user name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
end

test "user email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
end

test "email addresses should be unique" do
  duplicate_user = @user.dup
  @user.save
  assert_not duplicate_user.valid?
end

test "password should be present(non blank)" do
  @user.password = @user.password_confirmation = "  " * 6
  assert_not @user.valid?
end

test "password should be min length (6 chars)" do
  @user.password = @user.password_confirmation = "a" * 5
  assert_not @user.valid?
end


end
