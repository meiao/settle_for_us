require 'test_helper'

class SettleControllerTest < ActionController::TestCase
  test "should get settle" do
    get :settle
    assert_response :success
  end

end
