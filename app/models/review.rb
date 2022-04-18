class Review < ApplicationRecord
    belongs_to :written_by, class_name: "student"
    belongs_to :written_for, class_name: "student"
    belongs_to :project
end
