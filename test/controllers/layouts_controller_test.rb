require 'test_helper'

class LayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get layouts_home_url
    assert_response :success
  end

  test "should get about" do
    get layouts_about_url
    assert_response :success
  end

end
