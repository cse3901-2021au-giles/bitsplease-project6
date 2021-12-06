require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @test_admin = users(:admin)
    @test_student = users(:student1)
  end

  test 'show user' do
    assert_not_empty(@test_admin.user_display)
  end

  test 'return students' do
    assert_includes(@test_student.students, @test_student)
  end
end
