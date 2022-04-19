class Project < ApplicationRecord
    validates :desc, length: { maximum: 140 }
end
