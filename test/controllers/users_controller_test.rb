require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test_admin = users(:admin)
    @test_admin.password = 'password'
    @test_admin.password_confirmation = 'password'
    @test_admin.save
    @test_student = users(:student1)
    @test_student.password = 'password'
    @test_student.password_confirmation = 'password'
    @test_student.save
  end
  test 'should get new' do
    get signup_path
    assert_response :success
  end
  test 'should redirect edit when logged in as wrong user' do
    log_in_as(@test_student)
    get edit_user_path(@test_admin)
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when logged in as wrong user' do
    log_in_as(@test_student)
    patch user_path(@test_admin), params: { user: { name: @test_admin.name,
                                                    email: @test_admin.email,
                                                    password: 'password',
                                                    password_confirmation: 'password',
                                                    admin: true } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect index when not logged in' do
    get users_path
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch user_path(@test_admin), params: { user: { name: @test_admin.name,
                                                    email: @test_admin.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should not allow the admin attribute to be edited via the web' do
    log_in_as(@test_student)
    assert_not @test_student.admin?
    patch user_path(@test_student), params: {
      user: { password: 'password',
              password_confirmation: 'password',
              admin: true }
    }
    assert_not @test_student.admin?
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete user_path(@test_admin)
    end
    assert_redirected_to login_url
  end
  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@test_student)
    assert_no_difference 'User.count' do
      delete user_path(@test_admin)
    end
    assert_redirected_to root_url
  end
end
