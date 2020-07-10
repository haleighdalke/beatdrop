class SongsController < ApplicationController

    before_action :find_song, only:[:show,:edit, :update, :destroy]
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        redirect_to home_path(current_artist)
    end

    def update
        @song.update(song_params)
        redirect_to home_path(current_artist)
    end

    def destroy
        @song.delete
        redirect_to home_path(current_artist)
    end

    private

    def song_params
        params.require(:song).permit(:title, :genre_id, :artist_id, :image, :sound_link, :video_link)
    end

    def find_song
        @song = Song.find(params[:id])
    end
end

