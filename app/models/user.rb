class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum role: [:students, :admin]
         after_initialize :set_default_role 
         def set_default_role
          self.role ||= :students
         end
         validates :email, format: { with: /\A\S+@\S+.\S+\z/xi}
         
end
