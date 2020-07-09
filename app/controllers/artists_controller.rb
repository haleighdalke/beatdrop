class ArtistsController < ApplicationController

    before_action :find_artist, only:[:show, :edit, :update, :home]

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to home_path
        else
            flash[:message] = "Invalid entry. Please include both name and password."
            render 'new'
        end
    end

    def update
        if @artist.update(artist_params)
            redirect_to home_path
        else
            flash[:message] = "Invalid entry. Please include both name and password."
            render 'edit'
        end
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :profile_link, :image, :password, :password_confirmation)
    end

    def find_artist
        @artist = Artist.find(params[:id])
    end
end
