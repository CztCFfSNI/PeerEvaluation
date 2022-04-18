class Project < ApplicationRecord
    validates :desc, length: { maximum: 140 }
    has_many :reviews
end
