class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        # display flash error messages if invalid
        if @user.save
            @user.save
            redirect_to login_path
        else
            flash[:message] = "Invalid entry. Please include both name and age."
            render "new"
        end
    end

    def update
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user.delete
        session.clear
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :age)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
