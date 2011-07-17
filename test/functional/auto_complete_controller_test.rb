require 'test_helper'

class AutoCompleteControllerTest < ActionController::TestCase
  test "should get maps_list" do
    get :maps_list
    assert_response :success
  end

end
