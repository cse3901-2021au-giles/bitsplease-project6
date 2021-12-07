require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @test_ta = users(:ta1)
    @test_instructor = users(:instructor)
    @test_student = users(:student1)
    @test_course = courses(:course1)
  end

  test 'test has instructor' do
    assert_includes @test_course.instructors, @test_instructor
  end

  test 'test has students' do
    assert_includes @test_course.students, @test_student
  end

  test 'test has tas' do
    assert_includes @test_course.tas, @test_ta
  end
end
