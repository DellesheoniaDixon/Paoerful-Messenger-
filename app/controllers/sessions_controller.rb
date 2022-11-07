class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:session][:username])
        if user.present? && user.valid_password?(params[:session][:password])
            log_in(user)
        else
            flash[:alert] = "Invalid username or password"
            render :new
        end
    end

    def destroy
        log_out if logged_in?
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end


end