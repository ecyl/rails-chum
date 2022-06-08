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
50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: (1..80).to_a.sample,
    gender: ["M", "F"].sample,
    email: Faker::Internet.email,
    password: "12345678"
  )
  user.save!
end

users = User.all



puts "Creating events..."

LOCATION_STRING = ["10 Bayfront Ave, Singapore 018956", "313 Somerset Road",
  "53 Ang Mo Kio Avenue 3", "Queen Street", "Seletar Mall", "Tampines Mall",
  "Changi City Point", "Jewel Airport", "National University of Singapore",
  "Orchard Gateway", "Nex", "Vivo City", "Bukchon Hanok Traditional Village",
  "National Museum of Korea", "Lotte World Tower", "Gyeongbokgung Palace",
  "Bukhansan National Park", "Eiffel Tower", "Louvre Museum", "Palace of Versailles", "Mont Blanc", "Dune du Pilat", "Parc National des Calanques"]


  # 30 events

# 10 itineraries
puts "Creating itineraries..."
10.times do

  # create chatroom that comes with the itinerary
  chatroom = Chatroom.new(
    name: Faker::Lorem.word
  )

  chatroom.save!

  random_start_date = Faker::Date.between(from: '2022-05-20', to: '2022-12-28')
  random_end_date = random_start_date + (3..14).to_a.sample
  itinerary = Itinerary.new(
    title: "A great time in #{Faker::Nation.capital_city}",
    participant_limit: (2..8).to_a.sample,
    description: Faker::Company.catch_phrase,
    deadline: random_start_date - (3..10).to_a.sample
  )

  itinerary.chatroom = chatroom
  itinerary.user = User.all.sample
  itinerary.save!


  3.times do
    event = Event.new(
      title: Faker::Mountain.name,
      description: Faker::Company.catch_phrase,
      date_start: random_start_date,
      date_end: random_end_date,
      location: LOCATION_STRING.sample,
      cost: (50..1000).to_a.sample
    )
    event.itinerary = itinerary
    event.save!

  end
end
