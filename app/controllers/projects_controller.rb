class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    @students = Student.all
    @teams = Team.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @teams = Team.all
  end

  # GET /projects/new
  def new
    @project = Project.new
    @teams = Team.all
  end

  # GET /projects/1/edit
  def edit
    @teams = Team.all
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # Function to add project to a team
  def add
    @project = Project.find(params[:project_id])
    @team = Team.find(params[:team_id])
    if !(@project.teams.include? @team)
      @project_teams = ProjectTeam.new(project_id: params[:project_id], team_id: params[:team_id])
    
      respond_to do |format|
        if @project_teams.save
          format.html { redirect_to edit_project_url(@project), notice: "Team is successfully assigned." }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to project_url(@project)
    end
  end

  # Function to remove teams from a project
  def remove
    @team = Team.find(params[:team_id])
    @project = Project.find(params[:project_id])
    if @project.teams.include? @team
      @project.teams.delete @team
    
      respond_to do |format|
        format.html { redirect_to edit_project_url(@project), notice: "Team was successfully removed." }
        format.json { head :no_content }
      end
    else
      redirect_to project_url(@project)
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.teams.clear
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :desc)
    end
end
