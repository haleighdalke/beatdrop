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

binding.pry