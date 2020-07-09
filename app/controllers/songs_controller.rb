class SongsController < ApplicationController

    before_action :find_song, only:[:show,:edit, :update, :delete]
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
    end

    def update

    end

    def destroy

    end

    private

    def song_params
        params.require(:song).permit(:title, :image, :sound_link, :video_link)
    end

    def find_song
        @song = Song.find(params[:id])
    end
end

