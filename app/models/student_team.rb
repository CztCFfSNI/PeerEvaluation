class StudentTeam < ApplicationRecord
    belongs_to :student
    belongs_to :team
    validates :student_id, presence: true {message: 'student_id needed'}, numericality: {only_integer: true}
    validates :team_id, presence: true {message: 'team_id needed'}, numericality: {only_integer: true}
  
 end
 