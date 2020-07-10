# Beatdrop - RAILS APP

## Table of Contents
* General Info
* Technologies
* Setup
* User Story
* Features
* Inspiration
* Contributions

## General Info
This project was created by Haleigh Dalke and Danira Cortez for the purpose of learning Rails, ActiveRecord, HTML, and CSS. Mod2 Final Project at Flatiron School, presented on July 10, 2020.

Repo link: https://github.com/haleighdalke/jokebox

## Technologies
* Rails 6.0.3.2
* ActiveRecord
* Sqlite3
* HTML5
* CSS

## Setup
To view this project, please run the following in your terminal:
```
$ cd ./beatdrop         # be sure you're in this file directory
$ bundle install        # install necessary gems
```
Now go to the Artist model file and comment out `has_secure_password` (the seed file does not create new passwords for each artist). Run the following in your terminal:
```
$ rails db:migrate      # set up tables
$ rails db:seed         # seed the database from Deezer API
```
The program should be all set up and ready for you! Start by going to http://localhost:3000/login. 

## User Story 
You can explore All Songs/Artists/Genres from the footer links, but you won't be able to preview the sounds or video unless logged in. 

To sign up as a new user, click on "User" in the navigation bar and follow the "HERE" link at the bottom. As a User, you can explore and preview music, edit your profile in settings (name, age), and view your library of played songs (it counts for you!). 

To sign up as an Artist, be sure you've logged out as a User. Click on "Artist" in the navigation bar and follow the "HERE" link at the bottom to sign up. As an Artist, you can view/update your music from your profile page, create/edit/delete songs by you (title, genre, sound_link, and video_link), explore all songs/artist/genres (but remember you're not a user, so you can't preview!), and update your profile (name, image). 

Have fun discovering and creating new music!

## Features
* Login/sign up as a User (name, age) - create/edit/delete
* Login/sign up as an Artist (name, image, password) - create/edit
* Explore songs by title (alphabetical), artist, and genre
* Preview song audio and video (if included by the artist)
* Play a song as a user
* Create a song as an artist

## Inspiration
We were inspired to create an application with a similar platform as Spotify. We gravitated towards a music application because we wanted the user experience to inlude fun/interesting content.

## Troubles
We ran into many issues with the Spotify public API. Unfortunately our application is restricted to Rails without Javascript, so we were unable to include this API. After searching through dozens of public APIs, we settled on Deezer--it offered similar data that allowed us to incorporate audio and visual media. If we were to go back, we would have found an API that includes Genres (as you can see it's randomized in our program).

We also struggled with authenticating Artist and User seperately, and creating smooth transitions between their respective functionalites. We eventually arrived at a format that works well for our program--let us know what you think!

## Contributions
[ ] Danira Cortez
[ ] Haleigh Dalke
[ ] deezer.com