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

genres = ["Rop", "Rock", "Rap", "R&B", "Country", "Alternative", "Blues", "Indie"]
genres.each {|genre| Genre.create(name: genre)}

data["tracks"].each {|track| Artist.create(name: track["subtitle"])}

data["tracks"].each {|track| Song.create(title: track["title"], artist_id: Artist.find_or_create_by(name: track["subtitle"]).id, genre_id: Genre.all.sample.id)} 

User.create(name: "Haleigh", age: 24)
User.create(name: "Danira", age: 31)
User.create(name: "Zana", age: 22)
User.create(name: "Gabriel", age: 31)
User.create(name: "Brandon", age: 30)

50.times do
    rand_user_id = User.all.sample.id
    rand_song_id = Song.all.sample.id
    play = Play.find_or_create_by(user_id: rand_user_id, song_id: rand_song_id)
    if play.num_plays != nil
        num = play.num_plays + 1
        play.update(num_plays: num)
    else
        play.update(num_plays: 1)
    end
end
<% s = @songs.collect {|song| %>
    <% song.title %>
<% }.sort %>

<% s.each {|title| %>
    <%= link_to title, song_path(s) %><br>
<% } %>