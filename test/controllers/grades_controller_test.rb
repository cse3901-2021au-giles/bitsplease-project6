require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:course1)
    @grade = grades(:grade1)
    @team1 = teams(:team1)
    @instructor = users(:instructor)
    @instructor.password = 'password'
    @instructor.password_confirmation = 'password'
    @instructor.save
    @student1 = users(:student1)
    @student1.password = 'password'
    @student1.password_confirmation = 'password'
    @student1.save
    @student2 = users(:student2)
    @student2.password = 'password'
    @student2.password_confirmation = 'password'
    @student2.save
  end

  test 'should get index' do
    log_in_as(@instructor)
    get grades_url, params: { course_id: @course.id }
    assert_response :success
  end

  test 'should get new' do
    get new_grade_url
    assert_response :success
  end

  test 'should create grade' do
    log_in_as(@student1)
    assert_difference('Grade.count') do
      post grades_url, params: { grade: { score: 99,
                                          remarks: 'remarks',
                                          student_id: @student2.id,
                                          team_id: @team1.id } }
    end

    assert_redirected_to team_url(@team1)
  end

  test 'should get edit' do
    log_in_as(@instructor)
    get edit_grade_url(@grade)
    assert_response :success
  end

  test 'should update grade' do
    log_in_as(@instructor)
    patch grade_url(@grade), params: { grade: { id: @grade, score: '20' } }
    assert_redirected_to grade_url(@grade)
  end

  test 'should destroy grade' do
    log_in_as(@instructor)
    assert_difference('Grade.count', -1) do
      delete grade_url(@grade)
    end

    assert_redirected_to grades_url
  end
end
