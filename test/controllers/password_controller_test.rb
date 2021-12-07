require 'test_helper'

class PasswordControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get reset_password_url
    assert_response :success
  end
end
