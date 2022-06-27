# CHUM
CHUM is an application aimed at travellers who want find travel buddies to go on trips together. Users can either list an itinerary for people to follow, or join an existing itinerary posted by others. CHUM provides users with the flexibility to participate in trips that meet their personal travel needs with the freedom to participate in as many itineraries as the users want. Users can build their own personal trip itinerary by adding various events to their personal schedule. 

This project is a student product created during the Le Wagon Singapore bootcamp (batch #910).

See it live here: https://www.chum.voyage/

![CHUM homepage showcase](app/assets/gifs/homepage.gif)

## Built with
Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
* Ruby on Rails
* StimulusJS
* Bootstrap 5
* Cloudinary
* Babel

## Features
1. Login and Sign up
2. An organizer can create an itinerary
3. An organizer can add an event to the itinerary
4. An organizer can publish an itinerary for others to see
5. A user can view all itineraries created by other people
6. A user can search for itineraries by country name and trip start and end dates
7. An organizer can see the profile of a follower (vice versa)
8. An organizer can chat with interested followers (vice versa)
9. A user can request to join an itinerary.
10. An organizer can receive a request from a user wanting to join the itinerary
11. An organizer can accept/reject a potential follower's request to join
12. A follower can receive a notification from the organizer that he/she has been accepted into the trip
13. An organizer can post announcements about the trip
14. Users in the same itinerary can chat in a group chat

## See this project
You may get a local copy of this project by cloning this project by running these commands from your terminal:
1. Get a free Mapbox and Cloudinary API key at https://www.mapbox.com/ and https://cloudinary.com/
2. Clone the project
```
git clone https://github.com/rayjosong/rails-chum.git
```
3. Install Ruby gems and node packages
```
bundle install
yarn install
```
4. Create a `.env` file in the main directory
```
touch .env
```
* In the `.env` file, enter your Mapbox and Cloudinary APIs
```
MAPBOX_API_KEY= ENTER YOUR MAPBOX API
CLOUDINARY_URL= ENTER YOUR CLOUDINARY API
```
5. Create the database and seed the files
```
rails db:drop db:create db:migrate db:seed
```
6. Launch the project on your local machine in the browser
```
rails s
```
Go to http://localhost:3000/. Thank you and enjoy!

## Acknowledgements
The hands behind this project:
<table>
  <tr>
    <td align="center"><a href="https://github.com/ecyl"><img src="https://avatars.githubusercontent.com/ecyl" width="100px;" alt=""/><br /><sub><b>Eunice</b></sub></a></td>
    <td align="center"><a href="https://github.com/rayjosong"><img src="https://avatars.githubusercontent.com/rayjosong" width="100px;" alt=""/><br /><sub><b>Raymond</b></sub></a></td>
    <td align="center"><a href="https://github.com/germainewongg"><img src="https://avatars.githubusercontent.com/germainewongg" width="100px;" alt=""/><br /><sub><b>Germaine</b></sub></a></td>
    <td align="center"><a href="https://github.com/helen-tan"><img src="https://avatars.githubusercontent.com/helen-tan" width="100px;" alt=""/><br /><sub><b>Helen</b></sub></a></td>
  </tr>
 <table>

   Special thanks to the wonderful instructors of Le Wagon:

 <table>
  <tr>
    <td align="center"><a href="https://github.com/rayancastro"><img src="https://avatars.githubusercontent.com/rayancastro" width="100px;" alt=""/><br /><sub><b>Rayan</b></sub></a></td>
    <td align="center"><a href="https://github.com/AshIgnYeo"><img src="https://avatars.githubusercontent.com/AshIgnYeo" width="100px;" alt=""/><br /><sub><b>Ashley</b></sub></a></td>
    <td align="center"><a href="https://github.com/suansen"><img src="https://avatars.githubusercontent.com/suansen" width="100px;" alt=""/><br /><sub><b>Suan Sen</b></sub></a></td>
  </tr>
 <table>
