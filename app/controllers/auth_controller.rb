class Api::V1::AuthController < ApplicationController

    def spotify_request
        url = "https://accounts.spotify.com/authorize"
        query_params = {
            # double check encryption here
            client_id: Rails.application.credentials[Rails.env.to_sym][:spotify][:client_id],
            response_type: 'code',
            redirect_uri: 'http://localhost:3000/api/v1/user',
            scope: "user-library-read 
            playlist-read-collaborative 
            user-read-private 
            user-top-read",
            show_dialog: true
        }
        redirect_to "#{url}?#{query_params.to_query}"
    end

    def create
        # Request refresh and access tokens
        body = {
            grant_type: "authorization_code",
            code: params[:code],
            redirect_uri: 'http://localhost:3000/api/v1/user',
            client_id: Rails.application.credentials[Rails.env.to_sym][:spotify][:client_id],
            client_secret: Rails.application.credentials[Rails.env.to_sym][:spotify][:client_secret]
        }

        auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
        auth_params = JSON.parse(auth_response.body)
        header = {
            Authorization: "Bearer #{auth_params["access_token"]}"
        }

        user_response = RestClient.get("https://api.spotify.com/v1/me", header)
        user_params = JSON.parse(user_response.body)

        #---
        # Create User
        
    end
end









# class AuthController < ApplicationController


#     def login
#         if session[:user_id]
#             @user = User.find(session[:user_id])
#         else
#             @user = nil
#         end
#     end

#     def verify_username
#         # find username 
#         # if exists, redirect to user show page
#         # else sign up (user new)

#         @user = User.find_by(name: params[:auth][:name])

#         if @user
#             session[:user_id] = @user.id
#             redirect_to @user
#         else
#             flash[:message] = "Please enter the proper credentials"
#             render :login
#             #redirect_to new_user_path
#         end

#     end

#     def logout
#         session.clear
#         redirect_to login_path
#     end

# end