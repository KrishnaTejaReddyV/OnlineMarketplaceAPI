require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest

  # Actions to be performed before every test
  setup do
    @user = users(:userone)
    @user2 = users(:usertwo)
    @product = products(:one)
  end

  # Testing cart items display
  test "should show all cart items" do
    get addtocart_user_product_url(@user, @product)
    get user_cart_items_url(@user)
 
    assert_equal "index", @controller.action_name
    assert_no_match /(.*)"inventory_count":0(.*)/, @response.body
    assert_response :success
  end
  
  # Testing requested cart item display
  test "should show cart item" do
    get addtocart_user_product_url(@user, @product)
    get user_cart_item_url(@user, CartItem.last)

    assert_equal "show", @controller.action_name
    assert_no_match /(.*)"inventory_count":0(.*)/, @response.body
    assert_response :success
  end

  # Testing cart item creation
  test "should create cart item" do
    assert_difference('CartItem.count') do
      get addtocart_user_product_url(@user, @product)
    end
  
    assert_equal "addtocart", @controller.action_name
    assert_redirected_to user_cart_item_url(@user, CartItem.last)
  end

  # Testing cart items completion
  test "should complete cart" do
    get addtocart_user_product_url(@user, @product)
    get addtocart_user_product_url(@user2, @product) # So that CartItem still contains value after completing cart of userone
    get complete_user_cart_items_url(@user)
    
    assert_equal "complete", @controller.action_name
    assert_equal 0, CartItem.where(user_id: @user.id).count
    assert_not_equal 0, CartItem.where(user_id: @user2.id).count
    assert_redirected_to user_purchased_items_url(@user)
  end
 
  # Testing cart item removal
  test "should remove cart item" do
    get addtocart_user_product_url(@user, @product)
    assert_changes('CartItem.count') do
      get removefromcart_user_cart_item_url(@user, CartItem.last)
    end
    
    assert_equal "removefromcart", @controller.action_name
    assert_redirected_to user_cart_items_url(@user)
  end
end
