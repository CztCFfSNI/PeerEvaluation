class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
    @students = Student.all
  end

  # GET /teams/1 or /teams/1.json
  def show
    @students = Student.all
  end

  # GET /teams/new
  def new
    @team = Team.new
    @students = Student.all
  end

  # GET /teams/1/edit
  def edit
    @students = Student.all
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_url(@team), notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add
    @student_teams = StudentTeam.new(team_id: params[:team_id], student_id: params[:student_id])
    @student_teams.save

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully updated" }
      format.json { head :no_content }
    end

  end

  # Function to add students to a team (Sparsh)
  def add_students
    @team = Team.find(params[:id])
    params.permit([:student_emails])
    student_emails = params[:student_emails].split
    unsuccessful = []
    student_emails.each do |email|
      @student = Student.find_by email: email
      if @student != nil
        if !student.in? @team.students
          @team.students.push(@student)
          @team.save
          @student.teams.push(@team)
          @student.save
        end
      else 
        unsuccessful.push student_emails
      end
    end 

    respond_to do |format|
      if @team.save
        if !unsuccessful.empty?
          format.html { redirect_to teams_url, notice: "Unable to add: " + unsuccessful.join(", ") + ".\nAll other students added!" }
        else
          format.html {redirect_to teams_url, notice: "All students added!"}
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # Function to remove student (Sparsh)
  def remove_student
    @team = Team.find param[:team_id]
    @student = Student.find params[:student_id]
    @team.students.delete(@student)
    @team.save
    @student.teams.delete(@team)
    @student.save

    respond_to do |format|
      format.html { redirect_to teams_url notice: 'Student was successfully removed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      id = params[:team_id] || params[:id]
      @team = Team.find(id)
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :students)
    end
end
