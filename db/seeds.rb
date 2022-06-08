require 'faker'
require 'pry-byebug'

puts "Cleaning database..."
User.destroy_all
Itinerary.destroy_all
Event.destroy_all
ItineraryUser.destroy_all
ItineraryCriterium.destroy_all
Criterium.destroy_all
Announcement.destroy_all
Notification.destroy_all
Chatroom.destroy_all
Message.destroy_all
UserChatroom.destroy_all

puts "Creating users..."

# 10 users
11.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: (1..80).to_a.sample,
    gender: ["M", "F"].sample,
    email: Faker::Internet.email
  )
  user.save!
end

users = User.all

puts "Creating events..."

# 30 events
30.times do
  random_start_date = Faker::Date.between(from '2022-05-20', to: '2022-12-28')
  random_end_date = random_start_date + (3..14).to_a.sample
  puts random_end_date
  binding.pry
  event = Event.new(
    description: Faker::Company.catch_phrase,
    date_start: random_start_date,
    date_end: random_end_date,
    location: Faker::TvShows::Simpsons.location,
  )
end

# 10 itineraries
