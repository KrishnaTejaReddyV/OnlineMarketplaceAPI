require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  # Testing index page
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

end
