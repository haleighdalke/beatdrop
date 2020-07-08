class PlaysController < ApplicationController

    def create

        if session[:user_id] != nil
            @play = Play.new(user_id: session[:user_id], song_id: params[:song_id])
            @play.num_plays != nil ? @play.num_plays += 1 : @play.num_plays = 1
            @play.save
            redirect_to user_path(User.find(session[:user_id]))
        else
            flash[:message] = "You must login to play a song"
            redirect_to login_path
        end

    end
end
