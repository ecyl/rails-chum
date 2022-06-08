require 'faker'

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
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: [1..80].sample
    gender: ["M","F"].sample,
    email: Faker::Internet.email
  )
end


# 30 events

# 10 itineraries
