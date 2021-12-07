require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @admin.password = 'password'
    @admin.password_confirmation = 'password'
    @admin.save
    @non_admin = users(:student1)
    @non_admin.password = 'password'
    @non_admin.password_confirmation = 'password'
    @non_admin.save
  end

  test 'index as non-admin' do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
