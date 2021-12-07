require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  def setup
    @test_ta = users(:ta1)
    @test_instructor = users(:instructor)
    @test_student1 = users(:student1)
    @test_student2 = users(:student2)
    @test_course = courses(:course1)
    @test_grade = grades(:grade1)
    @test_team = teams(:team1)
    @test_project = projects(:project1)
  end

  test 'has name' do
    assert_equal @test_grade.student_name, @test_student1.name
  end

  test 'has team name' do
    assert_equal @test_grade.team_name, @test_team.name
  end

  test 'has reviewer name' do
    assert_equal @test_grade.reviewer_name, @test_student2.name
  end

  test 'has project name' do
    assert_equal @test_grade.project_name, @test_project.project_name
  end

  test 'has project id' do
    assert_equal @test_grade.project_id, @test_project.id
  end

  test 'has course no' do
    assert_equal @test_grade.course_no, @test_course.course_no
  end

  test 'has course id' do
    assert_equal @test_grade.course_id, @test_course.id
  end

  test 'has course' do
    assert_equal @test_grade.course, @test_course
  end

  test 'has graded date' do
    assert_not_empty @test_grade.grade_date
  end
end
