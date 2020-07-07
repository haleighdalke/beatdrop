class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show

    end

    def new
        @user = User.new
    end

    def create
        User.new(user_params)
        redirect_to user_path
    end

    def update
        @user.update(user_params)
        redirect_to user_path
    end

    def destroy
        @user.delete
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
