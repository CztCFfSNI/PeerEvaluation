class Student < ApplicationRecord
    has_many :student_teams
    has_many :teams, through: :student_teams
    has_many :reviews_for, class_name: "review", foreign_key: "written_for_id"
    has_many :reviews_by, class_name: "review", foreign_key: "written_by_id"
end
