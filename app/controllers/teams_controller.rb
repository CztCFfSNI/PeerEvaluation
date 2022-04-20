class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
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
    @team.students.clear
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Function to add students to a team (Sparsh, Zitao)
  def add
    @student = Student.find(params[:student_id])
    @team = Team.find(params[:team_id])
    if !(@team.students.include? @student)
      @student_teams = StudentTeam.new(team_id: params[:team_id], student_id: params[:student_id])
    
      respond_to do |format|
        if @student_teams.save
          format.html { redirect_to edit_team_url(@team), notice: "Teammate is successfully added." }
          format.json { render :show, status: :ok, location: @team }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @team.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to team_url(@team)
    end
  end

  # Function to remove students from a team (Sparsh, Zitao)
  def remove
    @student = Student.find(params[:student_id])
    @team = Team.find(params[:team_id])
    if @team.students.include? @student
      @team.students.delete @student
    
      respond_to do |format|
        format.html { redirect_to edit_team_url(@team), notice: "Student was successfully removed." }
        format.json { head :no_content }
      end
    else
      redirect_to team_url(@team)
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
      params.require(:team).permit(:name)
    end
end
