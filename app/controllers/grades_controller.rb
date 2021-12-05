class GradesController < ApplicationController
  before_action :set_grade, only: %i[ show edit update destroy ]

  # GET /grades or /grades.json
  def index
    @grades = Grade.all
  end

  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
    @grade.team_id = request.query_parameters["team_id"]
    @grade.student_id = request.query_parameters["user_id"]

  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)
    @grade.reviewer_id=current_user.id

    if @grade.save(validate: false)
      flash[:success]="Grade saved!"
      redirect_to @grade
    else
      render 'new'
    end

  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      flash[:success]="The grade has been updated."
      redirect_to @grade
    else
      render 'edit'
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    Grade.find(params[:id]).destroy
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
      params.require(:grade).permit(:remarks,:score, :student_id,:team_id)
    end
end
