require 'test_helper'

class PrivatePagesControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get landing_page" do
    get :landing_page
    assert_response :success
  end

end
