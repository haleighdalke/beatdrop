class PlaysController < ApplicationController

    def create
        if session[:user_id]
            @play = Play.find_by(user_id: session[:user_id], song_id: params[:song_id])
            if @play
                total = @play.num_plays + 1
                @play.update(num_plays: total)
            else
                Play.create(user_id: session[:user_id], song_id: params[:song_id], num_plays: 1)
            end
            redirect_to song_path(params[:song_id])
           # redirect_to user_path(User.find(session[:user_id]))
        else
            flash[:message] = "You must login to play a song"
            redirect_to login_path
        end
    end

end
