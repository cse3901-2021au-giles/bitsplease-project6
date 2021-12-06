class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  # GET /courses or /courses.json
  def index
    @courses = Course.all.reject{|c| c.users.exclude? current_user}
  end

  # GET /courses/1 or /courses/1.json
  def show
    set_course
  end

  # GET /courses/new
  def new
    @course = Course.new
    @course.user_ids.push current_user.id;
  end
   
  def create
    @course = Course.new(course_params)
    if(@course.course_no.empty?)
      @course.valid?
      render 'new'
    elsif @course.save(validate: false)
      flash[:success]="Course created!"
      redirect_to courses_url
    else
      render 'new'
    end
  end

  def edit
    set_course
    if(@course.user_ids.exclude?(current_user.id))
      flash[:success]="You are an instructor or TA of this course."
      redirect_to @course
    else
      render 'edit'
    end
  end


  def update
    set_course
    if @course.update(course_params)
      flash[:success]="The course has been updated."
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    set_course

    if(@course.user_ids.exclude?(current_user.id))
      flash[:success]="You are an instructor or TA of this course."
      redirect_to @course
    elsif
      @course.destroy
      flash[:success] = "Course deleted"
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
      p=params.require(:course).permit(:course_no, :semester, user_ids:[])
    end
end
