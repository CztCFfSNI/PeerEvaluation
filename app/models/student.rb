class Student < ApplicationRecord
    has_many :student_teams
    has_many :teams, through: :student_teams
    validates :email, format: { with: /\A\S+@\S+.\S+\z/xi}
    validates :Fname, presence: true, length: {maxium: 50}
    validates :Lname, presence: true, length: {maxium: 50}
 end
 