class Project < ApplicationRecord
    validates :desc, length: { maximum: 140 }
    has_many :project_teams
    has_many :teams, through: :project_teams
    validates :name, presence: true, length: {maxium: 50}
    validates :desc, presence: true, length: {maxium: 300}
  
 end
 