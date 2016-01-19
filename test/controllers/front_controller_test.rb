require 'test_helper'

class FrontControllerTest < ActionController::TestCase
  test "should get all_art" do
    get :all_art
    assert_response :success
  end

  test "should get by_size" do
    get :by_size
    assert_response :success
  end

end
