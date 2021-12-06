class GradesController < ApplicationController
  before_action :set_grade, only: %i[show edit update destroy]

  # GET /grades or /grades.json
  def index
    course_id = request.query_parameters['course_id']
    course_id = course_id.to_i unless course_id.nil?

    project_id = request.query_parameters['project_id']
    project_id = project_id.to_i unless project_id.nil?

    team_id = request.query_parameters['team_id']
    team_id = team_id.to_i unless team_id.nil?

    student_id = request.query_parameters['student_id']
    student_id = student_id.to_i unless student_id.nil?

    reviewer_id = request.query_parameters['reviewer_id']
    reviewer_id = reviewer_id.to_i unless reviewer_id.nil?

    admin_id = request.query_parameters['admin_id']
    admin_id = admin_id.to_i unless admin_id.nil?

    if admin_id.nil? and course_id.nil? and project_id.nil? and team_id.nil? and student_id.nil? and reviewer_id.nil?
      course_id = session[:course_id] if course_id.nil?
      project_id = session[:project_id] if project_id.nil?
      team_id = session[:team_id] if team_id.nil?
      student_id = session[:student_id] if student_id.nil?
      reviewer_id = session[:reviewer_id] if reviewer_id.nil?
    end

    if !student_id.nil?
      session[:student_id] = student_id
      @grade_title = 'My grades'
      @by_course = false
      @by_team = false
      @grades = Grade.all.reject { |g| g.student_id != student_id }
    elsif !reviewer_id.nil?
      @grade_title = "My peers' grades by me"
      @by_course = false
      @by_team = false
      session[:reviewer_id] = reviewer_id
      @grades = Grade.all.reject { |g| g.reviewer_id != current_user.id }
    elsif !team_id.nil?
      @grade_title = 'Grades of team'
      @by_course = false
      @by_project = false
      @by_team = true
      session[:team_id] = team_id
      @team = Team.find_by(id: team_id)
      @project = Project.find_by(id: @team.project_id)
      @course = Course.find_by(id: @project.course_id)
      @grades = Grade.all.reject { |g| g.team_id != team_id }
    elsif !project_id.nil?
      @grade_title = 'Grades of project'
      @by_course = false
      @by_project = true
      @by_team = false
      session[:project_id] = project_id
      @project = Project.find_by(id: project_id)
      @course = Course.find_by(id: @project.course_id)
      @grades = Grade.all.reject { |g| g.project_id != project_id }
    elsif !course_id.nil?
      @grade_title = 'Grades of class'
      @by_course = true
      @by_project = false
      @by_team = false
      session[:course_id] = course_id
      @course = Course.find_by(id: course_id)
      @grades = Grade.all.reject { |g| g.course_id != course_id }
    else
      @grade_title = 'All grades'
      @grades = Grade.all.reject { |g| my_courses.exclude? g.course }
    end
  end

  # GET /grades/1 or /grades/1.json
  def show; end

  # GET /grades/new
  def new
    @grade = Grade.new
    @grade.team_id = request.query_parameters['team_id']
    @grade.student_id = request.query_parameters['user_id']
  end

  # GET /grades/1/edit
  def edit; end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)
    @grade.reviewer_id = current_user.id

    if @grade.save
      flash[:success] = 'Grade saved!'
      @team = Team.find(@grade.team_id)
      redirect_to @team
    else
      render 'new'
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      flash[:success] = 'The grade has been updated.'
      redirect_to @grade
    else
      render 'edit'
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    Grade.find(params[:id]).destroy
    flash[:success] = 'The grade has been deleted'
    redirect_to grades_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grade
    @grade = Grade.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grade_params
    params.require(:grade).permit(:remarks, :score, :student_id, :team_id)
  end
end
