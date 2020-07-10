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
            flash[:message] = "Invalid username. Please enter the proper credentials."
            render :login
        end

    end

    def logout
        session.clear
        redirect_to login_path
    end

    def artist_login
    end

    def verify_artist
        @artist = Artist.find_by(name: params[:auth][:name])
    end

end