class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_student, only: %i[ show update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
    if !current_user.admin?
      @student = Student.find_by(email: current_user.email)
      if !@student.nil?
        @student_teams = StudentTeam.where(student_id: @student.id)
        @teams = []
        @student_teams.each do |st|
          @teams << Team.find_by(id: st.team_id)
        end
      end
    end
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new()
    if !current_user.admin?
      @student = Student.find_by(email: current_user.email)
      if !@student.nil?
        @student_teams = StudentTeam.where(student_id: @student.id)
        @teams = []
        @student_teams.each do |st|
          @teams << Team.find_by(id: st.team_id)
        end
      end
    else
      redirect_to '/'
    end
  end

  # GET /reviews/1/edit
  def edit
    if current_user.admin?
      respond_to do |format|
        format.html { redirect_to '/reviews', notice: "You have no authority to edit reviews." }
      end
    end
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @student = Student.find_by(email: current_user.email)
    if @student.id == @review.written_for_id
      respond_to do |format|
        if @review.save
          format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    elsif !@student.nil?
      check = Student.new
      @student.teams.each do |team|
        team.students.each do |student|
          if student.id != current_user.id && student.id == @review.written_for_id
            check = student
            break
          end
        end
      end
      p_id = []
      check.teams.each do |team|
        team.projects.each do |project|
          if !(p_id.include? project.id)
            p_id << project.id
          end
        end
      end
      if p_id.include? @review.project_id
        respond_to do |format|
          if @review.save
            format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @review.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to '/reviews', notice: "You are not allowed to give reviews to students who are not in your team!!!" }
        end
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated!" }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    if current_user.admin?
      respond_to do |format|
        format.html { redirect_to '/reviews', notice: "You have no authority to edit reviews!" }
      end
    else
      @review.destroy

      respond_to do |format|
        format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def get_my_reviews
    @reviews = Review.where("written_for_id =?", get_my_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @review = Review.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:personalscore, :workscore, :comment, :written_by_id, :written_for_id, :project_id)
    end

end
