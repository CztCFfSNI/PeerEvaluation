class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end
# POST /students or /students.json
  def create
      @student = Student.new(student_params)

      respond_to do |format|
        if @student.save
          format.html { redirect_to '/'}
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    if current_user.role == User.roles.keys[0] && @student.email == current_user.email
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/students'
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    if current_user.role == User.roles.keys[0] && @student.email == current_user.email
      @student.teams.clear
      @student.save
      @reviews = Review.where("written_by_id =?", @student.id)
      @reviews.each do |review|
        review.destroy
      end
      @reviews = Review.where("written_for_id =?", @student.id)
      @reviews.each do |review|
        review.destroy
      end
      @student.destroy
      current_user.destroy

      respond_to do |format|
        format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to '/students'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:Fname, :Lname, :email)
    end

end