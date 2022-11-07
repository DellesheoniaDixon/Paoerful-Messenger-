class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new, status: :bad_request
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end