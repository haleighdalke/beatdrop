class AuthController < ApplicationController


    def login
        
    end

    def verify_username
        # find username 
        # if exists, redirect to user show page
        # else sign up (user new)

        @user = User.find_by(name: params[:auth][:name])

        if @user
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = "Please enter the proper credentials"
            render :login
            #redirect_to new_user_path
        end

    end

    def logout
        session.clear
        byebug
        redirect_to login_path
    end

end