class Student < ApplicationRecord
    belongs_to :team
    has_many :reviews
end
