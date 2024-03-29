class Review < ApplicationRecord
    belongs_to :project
    validates :personalscore, presence: true, numericality: {only_integer: true}
    validates :workscore, presence: true, numericality: {only_integer: true}
    validates :comment, presence: true, length: {maximum: 150}
 end
 