require 'test_helper'

class FormsControllerTest < ActionController::TestCase
  test "should get edit_news" do
    get :edit_news
    assert_response :success
  end

end
