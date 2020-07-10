# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# clear out previous data
Artist.destroy_all
Song.destroy_all
Genre.destroy_all
User.destroy_all
Play.destroy_all

# method for initializing an artist object by ID from Deezer
def initialize_artist(artist_id)
    artist = RestClient::Request.execute(method: :get, url: "https://api.deezer.com/artist/#{artist_id}")
    artist_data = JSON.parse(artist)

    Artist.find_or_create_by(name: artist_data["name"], profile_link: artist_data["link"], image: artist_data["picture_big"])
end

# method for finding and parsing playlist data
def get_playlist_data(playlist_id)
    playlist = RestClient::Request.execute(method: :get, url: "https://api.deezer.com/playlist/#{playlist_id}")
    JSON.parse(playlist)
end
# initialize genres
genres = ["Rap", "Rock", "R&B", "Country", "Alternative", "Blues", "Indie"]
genres.each {|genre| Genre.create(name: genre)}

# collect some playlist IDs and seed the data
playlists = ["1014073671", "1377139645", "1963962142", "1431866505", "1130102843"]

playlists.each do |playlist_id|
    get_playlist_data(playlist_id)["tracks"]["data"].each do |track|
        initialize_artist(track["artist"]["id"])
        Song.create(title: track["title"], sound_link: track["preview"], artist_id: Artist.find_or_create_by(name: track["artist"]["name"]).id, genre_id: Genre.all.sample.id)
    end
end


