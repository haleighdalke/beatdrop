class ArtistAuthController < ApplicationController

    def artist_login
    end

    def verify_artist

        @artist = Artist.find_by(name: params[:artist_auth][:name])

        if @artist
            session[:artist_id] = @artist.id
            redirect_to home_path(@artist)
        else
            flash[:message] = "Invalid username. Please enter the proper credentials."
            render :artist_login
        end
    end

    def logout
        session.clear
        redirect_to artist_login_path
    end
end