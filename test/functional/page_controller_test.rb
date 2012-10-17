require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get links" do
    get :links
    assert_response :success
  end

  test "should get rules" do
    get :rules
    assert_response :success
  end

  test "should get teams" do
    get :teams
    assert_response :success
  end

  test "should get skating_school" do
    get :skating_school
    assert_response :success
  end

end
