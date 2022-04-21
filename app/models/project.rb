class Project < ApplicationRecord
    
    has_many :project_teams
    has_many :teams, through: :project_teams
    validates :name, presence: true, length: {maximum: 50}
    validates :desc, presence: true, length: {maximum: 300}
  
 end
 