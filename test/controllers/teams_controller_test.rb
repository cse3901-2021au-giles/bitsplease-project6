require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:team1)
    @instructor = users(:instructor)
    @instructor.password = 'password'
    @instructor.password_confirmation = 'password'
    @instructor.save
  end
  test 'should get index' do
    log_in_as(@instructor)
    get teams_url
    assert_response :success
  end 

  test 'should get new' do
    log_in_as(@instructor)
    get new_team_url
    assert_response :success
  end

  test 'should create team' do
    log_in_as(@instructor)
    assert_difference('Team.count') do
      post teams_url, params: { team: { name: 'test name' } }
    end

    assert_redirected_to edit_team_url(Team.last)
  end

  test 'should show team' do
    log_in_as(@instructor)
    get team_url(@team)
    assert_response :success
  end

  test 'should get edit' do
    log_in_as(@instructor)
    get edit_team_url(@team)
    assert_response :success
  end

  test 'should update team' do
    log_in_as(@instructor)
    patch team_url(@team), params: { team: { name: 'test name' } }
    assert_redirected_to team_url(@team)
  end

  test 'should destroy team' do
    log_in_as(@instructor)
    assert_difference('Team.count', -1) do
      delete team_url(@team)
    end

    assert_redirected_to teams_url
  end
end
