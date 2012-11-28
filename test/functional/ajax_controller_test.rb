require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get get_cal_for_team" do
    get :get_cal_for_team
    assert_response :success
  end

end
