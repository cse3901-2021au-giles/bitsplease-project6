require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:course1)
    @test_instructor = users(:instructor)
    @test_instructor.password = 'password'
    @test_instructor.password_confirmation = 'password'
    @test_instructor.save
    @test_student = users(:student1)
    @test_student.password = 'password'
    @test_student.password_confirmation = 'password'
    @test_student.save
  end

  test 'should get index' do
    log_in_as(@test_student)
    get courses_url
    assert_response :success
  end

  test 'should get new' do
    get new_course_url
    assert_response :success
  end

  test 'should create course' do
    assert_difference('Course.count') do
      post courses_url, params: { course: { course_no: 'test course' } }
    end

    assert_redirected_to courses_url
  end

  test 'should show course' do
    get course_url(@course)
    assert_response :success
  end

  test 'should get edit' do
    log_in_as(@test_instructor)
    get edit_course_url(@course)
    assert_response :success
  end

  test 'should update course' do
    log_in_as(@test_instructor)
    patch course_url(@course), params: { course: { course: 'test course' } }
    assert_redirected_to course_url(@course)
  end

  test 'should destroy course' do
    log_in_as(@test_instructor)
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
