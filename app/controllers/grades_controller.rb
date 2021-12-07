=begin
  Grades controller processes the grade requests to view, create, modify, and delete grades.
	There are 5 different ways you can view the student grades.
	1. From the course details page - it lists all grades added for all students who enroll into the course
	2. From the project details page - it lists all grades added for all students who participate in the project
	3. From the team details page - it lists all grades addes for the students in the team.
	4. From the Grades menu
		For an instructor, it lists all grades that the instructor has graded
		For a TA, it lists all grades that the TA has graded
		For a student, it has 2 sub-menus
			A student can view all grades that have been added for him/her
			A student can view all grades he/she have added for his peer

  If the user navigates to view a grade details, the Grade Summary link will take the user back
  to the grade summary using the same grade viewing method. Ex. If the user were on the grade summary
  of a course, the Grade Summary link on the grade details page will navigate the user to the grade 
  summary of the same course.
=end

class GradesController < ApplicationController
  # only available to teachers, TAs, or students
  before_action :correct_team_grade_user, only: [:index, :show, :new, :edit, :update, :destroy]
  
  # set the @grade object 
  before_action :set_grade, only: %i[ show edit update destroy ]


  # GET /grades or /grades.json
  def index

    byebug
    #check if the user wants to view the grades of a course
    course_id=request.query_parameters["course_id"]
    course_id=course_id.to_i unless course_id.nil?
    
    #check if the user wants to view the grades of a project
    project_id=request.query_parameters["project_id"]
    project_id=project_id.to_i unless project_id.nil?

    #check if the user wants to view the grades of a team    
    team_id=request.query_parameters["team_id"];
    team_id=team_id.to_i unless team_id.nil?

    #check if the student wants to view all his grades
    student_id=request.query_parameters["student_id"];
    student_id=student_id.to_i unless student_id.nil?

    #check if the student wants to view all grades he/she has added for his/her peers
    reviewer_id=request.query_parameters["reviewer_id"]
    reviewer_id=reviewer_id.to_i unless reviewer_id.nil?
    

    # if the user clicks on the Grade Summary link on the grade details page,
    # find the last grade summary filtering method and use it.
    if course_id.nil? and project_id.nil? and team_id.nil? and student_id.nil? and reviewer_id.nil?
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
      @grade_title = "My peers' grades by me" unless current_user.admin?
      @grade_title = "All grades" if current_user.admin?
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
      @grade_title="All grades"
      @grades = Grade.all.reject{|g| g.reviewer_id != current_user.id}
    end
    
    @course=Course.new if @course.nil?
    
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
    if @grade.update(grade_params)
      flash[:success] = 'The grade has been updated.'
      redirect_to @grade
    else
      render 'edit'
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    @grade.destroy
    flash[:success] = "The grade has been deleted"
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
