class ApplicationController < ActionController::Base

    #before_action :authenticate_user!

    #before_action :configure_permitted_parameters, if: :devise_controller?

    protected

#    def after_sign_in_path_for(resource)
#        
#    end

#    def configure_permitted_parameters
#        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
#    end

    helper_method :current_user

    def current_user
        user_exists = User.find_by_id(session[:user_id])

        if user_exists && session[:user_id]
            @current_user = User.find(session[:user_id])
        else
            session.delete(:user_id)
            @current_user = nil
        end
    end

    def log_in(user)
        session[:user_id] = user.id
        @current_user = user
        redirect_to root_path
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
