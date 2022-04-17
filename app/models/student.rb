class Student < ApplicationRecord
    has_many :student_teams
    has_many :teams, through: :student_teams
    has_many :reviews
end
