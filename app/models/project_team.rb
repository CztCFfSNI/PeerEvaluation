class ProjectTeam < ApplicationRecord
    belongs_to :project
    belongs_to :team
    validates :project_id, presence: true, numericality: {only_integer: true}
    validates :team_id, presence: true, numericality: {only_integer: true}
 end
 