# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.destroy_all
Song.destroy_all
Genre.destroy_all
User.destroy_all
Play.destroy_all



shazam_albums = RestClient::Request.execute(method: :get,
    url: "https://shazam.p.rapidapi.com/songs/list-recommendations?locale=en-US&key=484129036",
    headers:{
      "X-RapidAPI-Host" => "shazam.p.rapidapi.com",
      "X-RapidAPI-Key" => "0e0b34b737msh886349c7f7f01c1p1e9534jsn1bc7a4ba56e0"
    })

data = JSON.parse(shazam_albums)
    #   "response_type": "code",
    #   "redirect_uri":  "https://api.spotify.com/v1/albums",
    #   "client_secret": "f89df44d2f064caebb6f69600dd981fc",
    #   "client_id":     "57bbb588db2d4e88a92eb48721b242d9",
    # }


# -----from website: https://developer.spotify.com/console/get-several-albums/?ids=57bbb588db2d4e88a92eb48721b242d9&market=United%20States
# OAuth token:
# BQABzc48X2fV9PSoWHwqBI5xl23WYUvX_t_dokTDnnUzAsUf5V63KdM3fIzKdzTvQLnGsmmrTBDJBMgurw5UlqhJx83_r81IH5NfXLZq_lh3nIrY23EfuyHmeZGUvjwthxULyXPPTa4XhEbfa9ma9jGTNvhr

# (right of screen)
# GET https://api.spotify.com/v1/albums
# curl -X "GET" "https://api.spotify.com/v1/albums?ids=57bbb588db2d4e88a92eb48721b242d9&market=United%20States" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQABzc48X2fV9PSoWHwqBI5xl23WYUvX_t_dokTDnnUzAsUf5V63KdM3fIzKdzTvQLnGsmmrTBDJBMgurw5UlqhJx83_r81IH5NfXLZq_lh3nIrY23EfuyHmeZGUvjwthxULyXPPTa4XhEbfa9ma9jGTNvhr"

# other useful links:
# https://developer.spotify.com/documentation/general/guides/authorization-guide/
# https://developer.spotify.com/documentation/web-api/quick-start/
# https://developer.spotify.com/documentation/web-api/reference/albums/get-several-albums/

binding.pry

# -----------MISC CODE-------------------

# method: :get, 
#     url: "https://accounts.spotify.com/authorize", 
#     body:{
#     "client_id" => "57bbb588db2d4e88a92eb48721b242d9",
#     "client_secret" => "f89df44d2f064caebb6f69600dd981fc"
#   })
  

#  pokemon_cp = RestClient::Request.execute(method: :get, 
#     url: "https://pokemon-go1.p.rapidapi.com/pokemon_max_cp.json", 
#     headers:{
#     "X-RapidAPI-Host" => "pokemon-go1.p.rapidapi.com",
#     "X-RapidAPI-Key" => "5db3651e50msha9aec845d0458d1p1c2eefjsn7a066cc59d05"
#   })

