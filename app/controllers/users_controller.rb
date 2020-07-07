class UsersController < ApplicationController

    def index
        @spotify_albums = RestClient::Request.execute(
            method: :get,
            url: "https://accounts.spotify.com/authorize",
            headers: {
            "response_type": "code",
            "redirect_uri":  "https://api.spotify.com/v1/albums",
            "client_secret": "f89df44d2f064caebb6f69600dd981fc",
            "client_id":     "57bbb588db2d4e88a92eb48721b242d9",
            }
        )
    
    end
end
