require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get info_home_url
    assert_response :success
  end

end
