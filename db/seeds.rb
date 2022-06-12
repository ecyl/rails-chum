require 'faker'
require 'json'
require 'open-uri'

puts "Cleaning database..."
User.destroy_all
Itinerary.destroy_all
Event.destroy_all
ItineraryUser.destroy_all
ItineraryRestriction.destroy_all
Restriction.destroy_all
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
  random_num = (3..10).to_a.sample
  interested_users = User.all.sample(random_num)
  organiser = interested_users.pop # length - 1 due to pop
  itinerary.user = organiser



  #assign chatroom to itinerary
  itinerary.chatroom = chatroom
  itinerary.save!

  # assign accepted users to chatroom
  # accepted_users.each { |person| chatroom.users << person}
  accepted_user = interested_users.pop
  pending_users = interested_users # default value of itinerary_user is pending

  pending_users.each do |person|
    new = ItineraryUser.new
    new.itinerary = itinerary
    new.user = person
    new.save!
  end

  # interested_users.each do |person|
  #   new = ItineraryUser.new
  #   new.itinerary = itinerary
  #   new.user = person
  #   new.save!
  # end
  new = ItineraryUser.new
  new.itinerary = itinerary
  new.status = "accepted"
  new.user = accepted_user
  new.save!

  itinerary.save!

  chatroom.users << accepted_user
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





  3.times do
    event = Event.new(
      title: Faker::Mountain.name,
      description: Faker::Company.catch_phrase,
      date_start: random_start_date,
      date_end: random_end_date,
      location: LOCATION_STRING.sample, # PROBLEM: my location is not a subset of itnerary title now
      cost: (50..1000).to_a.sample
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

puts "Creating bika test user"
# Default user
bika = User.new(
  first_name: 'Bika',
  last_name: 'Chu',
  age: 28,
  gender: 'M',
  email: 'bika@gmail.com',
  password: '12345678'
)
bika.save!
5.times do
  notification = Notification.new(
    content: Faker::Quote.yoda
  )
  bika.notifications << notification
  notification.save!
end
bika_chat = Chatroom.new(name: 'bikaTime')
bika_chat.save!

# bika's itinerary
bika_iti = Itinerary.new(
  title: 'Bika the dog wants to walk around Sydney',
  participant_limit: 5,
  description: 'Follow bika around town for a walky walk.',
  deadline: '2022-06-30'
)
bika_iti.user = bika
bika_iti.chatroom = bika_chat
bika_iti.save!

users = User.all.sample(5) # include interested users
accepted_user = users.pop

# Save pending and their status
users.each do |person|
  new = ItineraryUser.new
  new.itinerary = bika_iti
  new.user = person
  new.save!
end

# Save accepted and their status
new = ItineraryUser.new
new.itinerary = bika_iti
new.user = accepted_user
new.save!

bika_iti.save!

bika_chat.users << accepted_user
bika_chat.users << bika
bika_chat.save!

bika_event_1 = Event.new(
  title: 'Bika walk',
  description: Faker::TvShows::StrangerThings.quote,
  date_start: DateTime.new(2022,6,15,8,10),
  date_end: DateTime.new(2022,6,16,9,0),
  location: 'Bondi beach',
  cost: (50..1000).to_a.sample
)
bika_event_1.itinerary = bika_iti
bika_event_1.save!

bika_event_2 = Event.new(
  title: 'Bika run',
  description: Faker::TvShows::StrangerThings.quote,
  date_start: DateTime.new(2022,6,15,10,15),
  date_end: DateTime.new(2022,6,15,11,15),
  location: 'Coogee beach',
  cost: (50..1000).to_a.sample
)
bika_event_2.itinerary = bika_iti
bika_event_2.save!

bika_event_3 = Event.new(
  title: 'Bika beg for food',
  description: 'Fatso begs for dinner scraps',
  date_start: DateTime.new(2022,6,15,12),
  date_end: DateTime.new(2022,6,15,13),
  location: 'Sydney opera house',
  cost: (50..1000).to_a.sample
)
bika_event_3.itinerary = bika_iti
bika_event_3.save!

bika_event_4 = Event.new(
  title: 'Bika is grumpy',
  description: 'Needs a fat nap',
  date_start: DateTime.new(2022,6,16,8),
  date_end: DateTime.new(2022,6,16,9),
  location: 'Royal Botanic Garden Syndey',
  cost: (50..1000).to_a.sample
)
bika_event_4.itinerary = bika_iti
bika_event_4.save!

bika_final = Event.new(
  title: 'Vecna please do not eat me',
  description: 'Be running up that hill, be running up that building',
  date_start: DateTime.new(2022,6,17,12),
  date_end: DateTime.new(2022,6,17,15),
  location: 'Sydney Zoo',
  cost: (50..1000).to_a.sample
)
bika_final.itinerary = bika_iti
bika_final.save!


puts "Creating restrictions..."
# creating itinerary_criteria – 1a) only women 1b) only men 2a) 20-30 y/o 2b) 30-40 y/o 2c) > 40 y/o
first_restriction = Restriction.new(
  title: "only women",
  restricted_gender: "F"
)
first_restriction.save!

second_restriction  = Restriction.new(
  title: "only men",
  restricted_gender: "M"
)
second_restriction.save!

third_restriction = Restriction.new(
  title: "20–30 year olds",
  min_age: 20,
  max_age: 30
)
third_restriction.save!

fourth_restriction = Restriction.new(
  title: "30-40 year olds",
  min_age: 30,
  max_age: 40
)
fourth_restriction.save!

fifth_restriction = Restriction.new(
  title: ">40 year old",
  min_age: 0,
  max_age: 40
)
fifth_restriction.save!

# create itinerary_criteria
Itinerary.all.each do |it|
  itinerary_restriction = ItineraryRestriction.new
  itinerary_restriction.description = Faker::Lorem.sentence(word_count: 20)
  itinerary_restriction.itinerary = it
  itinerary_restriction.restriction = Restriction.all.sample
  itinerary_restriction.save!
end

puts "Done with all models"
