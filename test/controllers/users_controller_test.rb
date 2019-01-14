require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  # Actions to be performed before every test
  setup do
    @user = users(:userone)
  end

  # Testing users display
  test "should show all users" do
    get users_url
 
    assert_equal "index", @controller.action_name
    assert_response :success
  end
  
  # Testing selected user display
  test "should show user" do
    get user_url(@user)

    assert_equal "show", @controller.action_name
    assert_redirected_to user_products_url(@user)
  end

  # Testing user creation
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { name: 'Test Name' }
    end
  
    assert_equal "create", @controller.action_name
    assert_response :created
  end
 
  # Testing user updation
  test "should update user" do
    put user_url(@user), params: { name: "updated" }
 
    assert_equal "update", @controller.action_name
    assert_redirected_to users_url
    @user.reload
    assert_equal "updated", @user.name
  end
 
  # Testing user deletion
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
 
    assert_equal "destroy", @controller.action_name
    assert_redirected_to users_url
  end
end
