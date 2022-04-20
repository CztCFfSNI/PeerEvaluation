class Project < ApplicationRecord
    validates :desc, length: { maximum: 140 }
    has_many :project_teams
    has_many :teams, through: :project_teams
end
