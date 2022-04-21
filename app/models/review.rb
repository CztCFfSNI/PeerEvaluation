class Review < ApplicationRecord
    validates :personalscore, presence: true, acceptance: {message: 'personal score needed'}, numericality: {only_integer: true}
    validates :workscore, presence: true, acceptance: {message: 'workscore needed'}, numericality: {only_integer: true}
    validates :comment, presence: true, length: {maximum: 150}
 end
 