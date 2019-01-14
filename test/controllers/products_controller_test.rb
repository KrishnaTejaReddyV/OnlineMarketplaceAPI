require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

  # Actions to be performed before every test
  setup do
    @user = users(:userone)
    @product = products(:one)
  end

  # Testing products display
  test "should show all products" do
    get user_products_url(@user)
 
    assert_equal "index", @controller.action_name
    assert_response :success
  end
  
  # Testing available products display
  test "should show available products" do
    get available_user_products_url(@user)

    assert_equal "available", @controller.action_name
    assert_response :success
    assert_no_match /(.*)"inventory_count":0(.*)/, @response.body
  end
  
  # Testing selected product display
  test "should show product" do
    get user_product_url(@user, @product)

    assert_equal "show", @controller.action_name
    assert_response :success
  end

  # Testing product creation
  test "should create product" do
    assert_difference('Product.count') do
      post user_products_url(@user), params: { title: 'Test Product', price: 10, inventory_count: 5 }
    end
  
    assert_equal "create", @controller.action_name
    assert_response :created
  end
 
  # Testing product updation
  test "should update product" do
    put user_product_url(@user, @product), params: { title: "updated" }
 
    assert_equal "update", @controller.action_name
    assert_redirected_to user_products_url(@user)
    @product.reload
    assert_equal "updated", @product.title
  end
 
  # Testing product deletion
  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete user_product_url(@user, @product)
    end
 
    assert_equal "destroy", @controller.action_name
    assert_redirected_to user_products_url(@user)
  end
end
