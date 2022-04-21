class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    @student = Student.find_by(email: current_user.email)
    @reviews = Review.where("written_for_id =?", @student.id)
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
    end
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_my_reviews
    @reviews = Review.where("written_for_id =?", get_my_id)
  end

  private
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:personalscore, :workscore, :comment, :written_by_id, :written_for_id, :project_id)
    end

end
