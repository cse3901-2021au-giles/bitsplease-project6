=begin
  A control to process the course view, create, update, delete requests
  Only an instructor or TA can create, update, or delete a course
  The instructor or TA can only view the courses that they teach.
=end
class CoursesController < ApplicationController
  # only available to instructors and TAs
  before_action :correct_admin_user, only: [:index, :show, :new, :edit, :update, :destroy]

  # Populate the @course object
  before_action :set_course, only: %i[ show edit update destroy ]


  # GET /courses or /courses.json
  def index
    #Make sure it only load courses the current user teaches
    @courses = Course.all.reject{|c| c.users.exclude? current_user}
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    #Pre-select the current user as a teacher or TA of the course
    @course.user_ids.push current_user.id;
  end
   
  # the method used to crate a course.
  def create
    #Make sure the Course object is valid before creating it. Or it will display
    # an error message for the user to complete the form before trying again
    @course = Course.new(course_params)
    if @course.course_no.empty?
      @course.valid?
      render 'new'
    elsif @course.save(validate: false)
      flash[:success] = 'Course created!'
      redirect_to courses_url
    else
      render 'new'
    end
  end

  def edit
    # Make sure the current user is the instructor or TA of the course before 
    # letting him/her modifying the course
    if(@course.user_ids.exclude?(current_user.id))
      flash[:success]="You are not an instructor or TA of this course."
      redirect_to @course
    else
      render 'edit'
    end
  end

  def update
    # Update the course. Show the updated course info if it succeeds, or returns to 
    # the modify course page.
    if @course.update(course_params)
      flash[:success] = 'The course has been updated.'
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    # make sure the current user is an instructor or TA before letting him/her
    # delete the course
    if(@course.user_ids.exclude?(current_user.id))
      flash[:success]="You are not an instructor or TA of this course."
      redirect_to @course
    elsif @course.destroy
      flash[:success] = 'Course deleted'
      redirect_to courses_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    p = params.require(:course).permit(:course_no, :semester, user_ids: [])
  end
end
