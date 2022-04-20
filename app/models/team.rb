class Team < ApplicationRecord
    has_many :student_teams
    has_many :students, through: :student_teams
    has_many :project_teams
    has_many :projects, through: :project_teams
end
