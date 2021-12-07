require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:project1)
    @course = courses(:course1)
    @instructor = users(:instructor)
    @instructor.password = 'password'
    @instructor.password_confirmation = 'password'
    @instructor.save
  end

  test 'should get index' do
    log_in_as(@instructor)
    get projects_url
    assert_response :success
  end

  test 'should get new' do
    log_in_as(@instructor)
    get new_project_url
    assert_response :success
  end

  test 'should create project' do
    log_in_as(@instructor)
    assert_difference('Project.count') do
      post projects_url, params: { project: { project_name: 'test name',
                                              course_id: @course.id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test 'should show project' do
    log_in_as(@instructor)
    get project_url(@project)
    assert_response :success
  end

  test 'should get edit' do
    log_in_as(@instructor)
    get edit_project_url(@project)
    assert_response :success
  end

  test 'should update project' do
    log_in_as(@instructor)
    patch project_url(@project), params: { project: { project_name: 'test name',
                                                      course_id: @course.id } }
    assert_redirected_to project_url(@project)
  end

  test 'should destroy project' do
    log_in_as(@instructor)
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
