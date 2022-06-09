require 'faker'
require 'pry-byebug'

puts "Cleaning database..."
User.destroy_all
Itinerary.destroy_all
Event.destroy_all
ItineraryUser.destroy_all
ItineraryCriteria.destroy_all
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

  5.times do
    notification = Notification.new(
      content: Faker::Quote.yoda,
    )
    user.notifications << notification
    notification.save!
  end
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
    deadline: random_start_date - (5..10).to_a.sample
  )

  # assign organiser
  random_num = (2..10).to_a.sample
  interested_users = User.all.sample(random_num)
  organiser = interested_users.pop # length - 1 due to pop
  itinerary.user = organiser

  #assign chatroom to itinerary
  itinerary.chatroom = chatroom
  itinerary.save!

  # assign group users to chatroom
  interested_users.each { |person| chatroom.users << person}
  chatroom.users << organiser
  chatroom.save!

  # populate chatroom with some messages
  5.times do
    message = Message.new(
      content: Faker::TvShows::StrangerThings.quote
    )
    message.chatroom = chatroom
    message.user = organiser
    message.save!
  end

  # assign itinerary_users
    # every interested_user thats not organiser is a member
  interested_users.each do |person|
    new = ItineraryUser.new
    new.itinerary = itinerary
    new.user = person
    new.save!
  end
  itinerary.save!


  3.times do
    event = Event.new(
      title: Faker::Mountain.name,
      description: Faker::Company.catch_phrase,
      date_start: random_start_date,
      date_end: random_end_date,
      location: LOCATION_STRING.sample, # PROBLEM: my location is not a subset of itnerary title now
      cost: (50.00..1000.00).to_a.sample
    )
    event.itinerary = itinerary
    event.save!
  end

  5.times do
    announcement = Announcement.new(
      content: Faker::TvShows::GameOfThrones.quote
    )
    itinerary.announcements << announcement
    announcement.save!
  end

end
puts "Each itinerary created with existing chatroom, some announcements, some events. Criteria not assigned yet though (TODO)."



puts "Creating criteria..."
# creating itinerary_criteria – 1a) only women 1b) only men 2a) 20-30 y/o 2b) 30-40 y/o 2c) > 40 y/o
first_criterium = Criterium.new(
  title: "only women",
  restricted_gender: "F"
)
first_criterium.save!

second_criterium = Criterium.new(
  title: "only men",
  restricted_gender: "M"
)
second_criterium.save!

third_criterium = Criterium.new(
  title: "20–30 year olds",
  min_age: 20,
  max_age: 30
)
third_criterium.save!

fourth_criterium = Criterium.new(
  title: "30-40 year olds",
  min_age: 30,
  max_age: 40
)
fourth_criterium.save!

fifth_criterium = Criterium.new(
  title: ">40 year old",
  min_age: 0,
  max_age: 40
)
fourth_criterium.save!

create itinerary_criteria
Itinerary.all.each do |it|
  itinerary_criterium = ItineraryCriterium.new
  itinerary_criterium.itinerary = it
  binding.pry
  itinerary_criterium.criterium = Criterium.all.sample
  itinerary_criterium.save!
end
