class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    include ApplicationHelper

    before_action :configure_permitted_parameters, if: :devise_controller?

    def get_my_id 
      id = Student.where("email =?", current_user.email).pluck(:id).first
      puts id
      id
    end

    private
      def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
      end

end
