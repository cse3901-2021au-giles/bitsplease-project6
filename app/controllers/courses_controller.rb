class CoursesController < ApplicationController
  

  # GET /courses or /courses.json
  def index
    @courses = Course.all.paginate(page: params[:page])
  end

  # GET /courses/1 or /courses/1.json
  def show
    @course=Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
    @course.user_ids=[]
  end
   
  def create
    @course = Course.new(course_params)
    if @course.save(validate: false)
      flash[:success]="Course created!"
      redirect_to courses_url
    else
      render 'new'
    end
  end

  def edit
    @course=Course.find(params[:id])
  end


  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:success]="The course has been updated."
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted"
    redirect_to courses_url    
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
