class ProjectTeam < ApplicationRecord
    belongs_to :project
    belongs_to :team
    validates :project_id, presence: true, numericality: {only_integer: true}
    validates :team_id, presence: true, numericality: {only_integer: true}

    private
	   def validate_project_id
	      errors.add(:project_id, "does not exist") unless Project.exists?(self.project_id)
	   end
	private	
	   def validate_team_id
	      errors.add(:team_id, "does not exist") unless Team.exists?(self.team_id)
	   end
 end
 