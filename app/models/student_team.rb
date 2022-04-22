class StudentTeam < ApplicationRecord
    belongs_to :student
    belongs_to :team
    validates :student_id, presence: true, numericality: {only_integer: true}
    validates :team_id, presence: true, numericality: {only_integer: true}
  

    private
	   def validate_student_id
	      errors.add(:student_id, "does not exist") unless Student.exists?(self.student_id)
	   end
	private	
	   def validate_team_id
	      errors.add(:team_id, "does not exist") unless Team.exists?(self.team_id)
	   end
 end
 