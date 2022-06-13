require 'faker'
require 'json'
require 'open-uri'
require 'date'

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

def get_address(event)
  if event.valid?
    endpoint = 'mapbox.places'
    longitude = event.longitude
    latitude = event.latitude
    url = "https://api.mapbox.com/geocoding/v5/#{endpoint}/#{longitude},#{latitude}.json?access_token=pk.eyJ1IjoiZ2VybWFpbmV3b25nZyIsImEiOiJjbDM4Y29vMngwMDlvM2ltZ3Eza3A0ano4In0.pI8jmt7xFxWsty2RwV2XLw"
    mapbox_call = URI.open(url).read
    address = JSON.parse(mapbox_call)['features'][1]['place_name'];
    event.address = address
  end
  event.save!
end

puts "Creating users..."


REQUEST_MESSAGES = ["Please let me join!!!!", \
                    "I would love to join this trip, because there are a lot of like-minded people", \
                    "Sounds like a really well-planned trip! please count me in!", "I'm a huge fan of your itineraries. Please let me join."]

GROUP_CHATROOM_MESSAGES = ["We are going to grab some ramen before the event. Feel free to join us.", \
                          "It seems like it's going to rain... Is the event still on?",\
                          "Hi everyone! I'm super excited for the trip.", \
                          "Hi everyone! Glad to meet all of you. Do remember to bring a jacket as it will be cold",
                          "Anyone has mints?", "Remember to bring a jacket guys.", "I'm hungry, is anyone else hungry too?", "Actually I'm starting to miss home..."]

SINGAPORE_LOCATIONS = ["Marina Bay Sands", "Bugis Street", "Jewel Changi", "Sentosa", "Esplanade", "Tampines Mall", "Nex", "Sungei Buloh Wetland Reserve"]

KOREA_LOCATIONS = ["Busan", "N Seoul Tower", "Lotte World", "Everland", "Haeundae Beach", "Jagalchi Market", "Nami Island", "Korean Folk Village", "Jeju"]

THAILAND_LOCATIONS = ["Khao Sok National Park", "Pratunam", "Koh Samet", "Chiang Mai", "Chatuchak", "Free Bird Cafe"]

NEWYORK_LOCATIONS = ["Statue of Liberty", "Central Park", "Rockefeller Center", "Metropolitan Museum of Art", "Empire State Building"]

FRANCE_LOCATIONS = ["The Charming Countryside of Provence", "Colmar", "Normandy", "Louvre Museum", "Eiffel Tower", "Notre-Dame de Paris Cathedral"]

SWITZERLAND_LOCATIONS = ["Interlaken", "Lucerne", "Lake Geneva", "Davos", "Lake Lugana"]

JAPAN_LOCATIONS = ["Mount Fuji", "Imperial Tokyo", "Hiroshima Peace Memorial Park", "Hokkaido", "Osaka Castle"]

COST_ARRAY = [50, 58, 68, 120, 150, 200, 347, 430, 500]

LANGUAGES = ['Chinese', 'Tagalog', 'Thai', 'Vietnamese', 'Indonesian', 'Korean', 'Japanese', 'French', 'German', 'Spanish', 'Latin', 'English']
# itinerary.title, itinerary.description

# <–––––––––––––––––––––––––––––––––– CREATE RESTRICTIONS ––––––––––––––––––––––––––––––––––>

puts "Creating restrictions for itineraries"

# men-only
first_res = Restriction.new(
  title: "Men only",
  restricted_gender: "M"
)

first_res.save!

# women-only
second_res = Restriction.new(
  title: "Women only",
  restricted_gender: "W"
)

second_res.save!

# 20 – 30 y/o
third_res = Restriction.new(
  title: "Only 20-30 year olds",
  min_age: 20,
  max_age: 30
)

third_res.save!

# > 40 y/o
fourth_res = Restriction.new(
  title: "Only >40 year olds",
  min_age: 40,
  max_age: 100
)

fourth_res.save!

# 30 – 40 y/o
fifth_res = Restriction.new(
  title: "Only 30-40 year olds",
  min_age: 30,
  max_age: 40
)

fifth_res.save!

# # <–––––––––––––––––––––––––––––––––– END RESTRICTIONS ––––––––––––––––––––––––––––––––––>
def create_one_itinerary(itinerary_title, itinerary_description, destination, date_start)
  puts "–––––––––––––––––––––––––– CREATING NEW ITINERARY FLOW ––––––––––––––––––––––––––"

  description = [
    "If you’re looking for the most balanced island in #{destination} that’s blessed with natural beauty, outdoor fun, creature comforts, top-notch dining, and warm alohas, look no further. This is what a #{destination} itinerary looks like which combines the top things to do with hidden gems all-in-one.",
    "#{destination} is one of the best hubs in the world. Whether you’re connecting through the city and have a 48 hour layover or if you’re using it as a launching pad, this is a guide on how to make the most of your time in #{destination}.",
    "There's no better place to be than #{destination}. Look no further, I've been to this place countless time and these are the places I've enjoyed the most. Reach out to find out more!"
  ]
  # ––––– USER –––––
  # create users
  current_iti_users = []
  10.times do
    user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name ,
      age: (18..65).to_a.sample,
      gender: ["M","F"].sample,
      email: Faker::Internet.email,
      password: "12345678",
      languages: "#{LANGUAGES.sample}, #{LANGUAGES.last}"
    )
    user.save!
    current_iti_users << user
  end

  # assigning organisers, accepted users and pending users (TODO: assign itinerary_users)
  puts "assigning organisers, accepted users and pending users"
  organiser = current_iti_users.last
  current_iti_users.pop
  accepted_users = current_iti_users.sample(rand(1..current_iti_users.size)) # choose random number of accepted users

  # remove accepted users from array. Remaining array: pending_users
  accepted_users.each do |accepted_user|
    current_iti_users.delete(accepted_user)
  end

  pending_users = current_iti_users
  # ––––– ITINERARIES –––––
  # itinearies -> must have chatroom & organiser
  itinerary = Itinerary.new(
    title: itinerary_title,
    participant_limit: accepted_users.size + 3,
    description: description.sample,
    destination: destination,
    finalised: false,
    deadline: date_start - 10
  )

  puts "creating chatroom for current itinerary"
  # ––––– CHATROOM (each chatroom has many messages) –––––
  # chatroom -> assign organiser to chatroom first
  chatroom = Chatroom.new(
    name: itinerary.title
  )

  chatroom.save!

  itinerary.chatroom = chatroom
  itinerary.user = organiser
  itinerary.save! # I should be able to save now

  # --- CREATING ITINERARY USERS ---
  pending_users.each do |p_user|
    itinerary_user = ItineraryUser.new(
      status: "pending",
      message: REQUEST_MESSAGES.sample
    )
    itinerary_user.user = p_user
    itinerary_user.itinerary = itinerary
    itinerary_user.save!
  end

  accepted_users.each do |a_user|
    itinerary_user = ItineraryUser.new(
      status: "accepted",
      message: REQUEST_MESSAGES.sample
    )

    itinerary_user.user = a_user
    itinerary_user.itinerary = itinerary
    itinerary_user.save!

    # adding accepted members to chatroom
    chatroom.users << a_user
    chatroom.save!
  end


  # ––––– MESSAGES –––––
  puts "creating messages within chatroom"
  5.times do
    message = Message.new(
      content: GROUP_CHATROOM_MESSAGES.sample
    )
    message.user = accepted_users.sample
    message.chatroom = chatroom
    message.save!

    chatroom.messages << message
    chatroom.save!
  end

  # save itinerary -> append events to each itinerary

  # ––––– EVENTS (one itinerary has many events) –––––

  case destination
  when "Singapore"
    sampled_location = SINGAPORE_LOCATIONS.sample(5)
  when "Korea"
    sampled_location = KOREA_LOCATIONS.sample(5)
  when "Thailand"
    sampled_location = THAILAND_LOCATIONS.sample(5)
  when "New York"
    sampled_location = NEWYORK_LOCATIONS.sample(5)
  when "France"
    sampled_location = FRANCE_LOCATIONS.sample(5)
  when "Switzerland"
    sampled_location = SWITZERLAND_LOCATIONS.sample(5)
  when "Japan"
    sampled_location = JAPAN_LOCATIONS.sample(5)
  end

  first_event_location = sampled_location[0]
  # –––––––––––––– CREATE 5 EVENTS ––––––––––––––
  first_event = Event.new(
    description: "Bored? Nothing to do? Too much money to spend? Join us quick!",
    cost: COST_ARRAY.sample,
    location: first_event_location,
    title: "A fabulous time",
    date_start: date_start,
    date_end: date_start + 1
  )
  first_event.itinerary = itinerary
  first_event.save!
  get_address(first_event)


  second_event_location = sampled_location[1]
  second_event = Event.new(
    description: "Come join if you don't want to fomo!",
    cost: COST_ARRAY.sample,
    location: second_event_location,
    title: "Beautiful night in #{second_event_location}",
    date_start: Faker::Time.between_dates(from: date_start + 1, to: date_start + 1, period: :night),
    date_end: Faker::Time.between_dates(from: date_start + 1, to: date_start + 2, period: :morning)
  )

  second_event.itinerary = itinerary
  second_event.save!

  third_event_location = sampled_location[2]
  third_event = Event.new(
    description: "We are going to have so much fun in #{third_event_location}",
    cost: COST_ARRAY.sample,
    location: third_event_location,
    title: "Superb afternoon in #{third_event_location}",
    date_start: Faker::Time.between_dates(from: date_start + 2 , to: date_start + 2, period: :afternoon),
    date_end: Faker::Time.between_dates(from: date_start + 2, to: date_start + 2, period: :night)
  )

  third_event.itinerary = itinerary
  third_event.save!

  fourth_event_location = sampled_location[3]
  fourth_event = Event.new(
    description: "No more lame lorems........",
    cost: COST_ARRAY.sample,
    location: fourth_event_location,
    title: "Awesome supper in #{fourth_event_location}",
    date_start: Faker::Time.between_dates(from: date_start + 3, to: date_start + 3, period: :night),
    date_end: Faker::Time.between_dates(from: date_start + 4, to: date_start + 4, period: :morning)
  )

  fourth_event.itinerary = itinerary
  fourth_event.save!

  # xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx EVENTS DONE xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  # ––––– ANNOUNCEMENTS (one itinerary has many announcements) –––––
  puts "creating a lame announcement for itinerary"
  announcement = Announcement.new(
    content: "Hello everyone! Hope you are excited as I am...... Or am I the only one excited? Hola at me if you need anything!"
  )
  announcement.itinerary = itinerary
  announcement.save!

  # ––––– RESTRICTIONS (one itinerary has many restrictions through itinerary_restrictions) –––––

    # ITINERARY_RESTRCTIONS: write a short description

    puts "–––––––––––––––––––––––––– ITINERARY FLOW COMPLETED ––––––––––––––––––––––––––"
end

# def create_one_itinerary(itinerary_title, itinerary_description, destination, date_start)
first_date = DateTime.now
second_date = DateTime.new(2022, 7, 3)
third_date = DateTime.new(2022, 7, 20)
fourth_date = DateTime.new(2022, 8, 5)
fifth_date = DateTime.new(2022, 9, 12)
sixth_date = DateTime.new(2022, 10, 1)
seventh_date = DateTime.new(2022, 10, 20)
eighth_date = DateTime.new(2022, 11, 2)
ninth_date = DateTime.new(2022, 12, 1)

create_one_itinerary("Best trip ever",
                    "We are going to have a breathtaking trip in Singapore. Come to enjoy a well-crafted route where we deep dive into exciting locations. Looking for like-minded people to join and have a great time together",
                    "Singapore",
                    first_date
)

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
  deadline: '2022-06-30',
  destination: "Singapore"
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
get_address(bika_event_1)

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
get_address(bika_event_2)

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
get_address(bika_event_3)

bika_event_4 = Event.new(
  title: 'Bika is grumpy',
  description: 'Needs a fat nap',
  date_start: DateTime.new(2022,6,16,8),
  date_end: DateTime.new(2022,6,16,9),
  location: 'Royal Botanic Garden Sydney',
  cost: (50..1000).to_a.sample
)
bika_event_4.itinerary = bika_iti
bika_event_4.save!
get_address(bika_event_4)

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
get_address(bika_final)


puts "Creating restrictions..."
# creating itinerary_criteria – 1a) only women 1b) only men 2a) 20-30 y/o 2b) 30-40 y/o 2c) > 40 y/o
first_restriction = Restriction.new(
  title: "only women",
  restricted_gender: "F"
)

create_one_itinerary("We are going on a magic schoolbus trip~",
                    "Looking for great travel buddies? Come join us! Only looking for easy-going people.",
                    "Korea",
                    second_date
)

create_one_itinerary("Korea awesomeness!",
                    "Only kpop lovers allowed ok?",
                    "Korea",
                    third_date
)

create_one_itinerary("Japan otakus unite!",
                    "Only people who to cosplay are allowed ok?",
                    "Japan",
                    fourth_date
)

create_one_itinerary("$50 per meal country",
                    "We can afford this cos we are rich!",
                    "Switzerland",
                    fifth_date
)

create_one_itinerary("Tu parle Francais?",
                    "Rassemblant tous les francophones",
                    "France",
                    sixth_date
)

create_one_itinerary("Living the New York dream!",
                    "Shall we also spend time to watch a New York Knicks game please?",
                    "France",
                    ninth_date
)

create_one_itinerary("Thailand rules!",
                    "Spending more time in the outskirts of Thailand because Thailand is really great",
                    "Thailand",
                    seventh_date
)

create_one_itinerary("Women in Korea!",
                    "Organising a girl-only trip, and since we're in Korea, let's dress up",
                    "Korea",
                    seventh_date
)

create_one_itinerary("Calling all oppa-wannabes!",
                    "Organising a men-only trip, and since we're in Korea, let's look like real oppas",
                    "Korea",
                    ninth_date
)

create_one_itinerary("Tour in Singapore",
                    "Awesome time ahead",
                    "Singapore",
                    first_date
)

create_one_itinerary("Come join us in Singapore!",
                    "Hopefully its not too hot.. haha",
                    "Singapore",
                    second_date
)

create_one_itinerary("Summer in Korea!",
                    "Hopefully its not too hot.. haha",
                    "Korea",
                    first_date
)


# require 'faker'
# require 'json'
# require 'open-uri'

# puts "Cleaning database..."
# User.destroy_all
# Itinerary.destroy_all
# Event.destroy_all
# ItineraryUser.destroy_all
# ItineraryRestriction.destroy_all
# Restriction.destroy_all
# Announcement.destroy_all
# Notification.destroy_all
# Chatroom.destroy_all
# Message.destroy_all
# UserChatroom.destroy_all

# puts "Creating users..."

# # 10 users
# 50.times do
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     age: (1..80).to_a.sample,
#     gender: ["M", "F"].sample,
#     email: Faker::Internet.email,
#     password: "12345678"
#   )
#   user.save!

#   5.times do
#     notification = Notification.new(
#       content: Faker::Quote.yoda,
#     )
#     user.notifications << notification
#     notification.save!
#   end
# end

# users = User.all


# puts "Creating events..."

# LOCATION_STRING = ["10 Bayfront Ave, Singapore 018956", "313 Somerset Road",
#   "53 Ang Mo Kio Avenue 3", "Queen Street", "Seletar Mall", "Tampines Mall",
#   "Changi City Point", "Jewel Airport", "National University of Singapore",
#   "Orchard Gateway", "Nex", "Vivo City", "Bukchon Hanok Traditional Village",
#   "National Museum of Korea", "Lotte World Tower", "Gyeongbokgung Palace",
#   "Bukhansan National Park", "Eiffel Tower", "Louvre Museum", "Palace of Versailles", "Mont Blanc", "Dune du Pilat", "Parc National des Calanques"]


#   # 30 events

# # 10 itineraries
# puts "Creating itineraries..."
# 10.times do
#   # create chatroom that comes with the itinerary
#   chatroom = Chatroom.new(
#     name: Faker::Lorem.word
#   )

#   chatroom.save!

#   random_start_date = Faker::Date.between(from: '2022-05-20', to: '2022-12-28')
#   random_end_date = random_start_date + (3..14).to_a.sample
#   itinerary = Itinerary.new(
#     title: "A great time in #{Faker::Nation.capital_city}",
#     participant_limit: (2..8).to_a.sample,
#     description: Faker::Company.catch_phrase,
#     deadline: random_start_date - (5..10).to_a.sample
#   )

#   # assign organiser
#   random_num = (3..10).to_a.sample
#   interested_users = User.all.sample(random_num)
#   organiser = interested_users.pop # length - 1 due to pop
#   itinerary.user = organiser



#   #assign chatroom to itinerary
#   itinerary.chatroom = chatroom
#   itinerary.save!

#   # assign accepted users to chatroom
#   # accepted_users.each { |person| chatroom.users << person}
#   accepted_user = interested_users.pop
#   pending_users = interested_users # default value of itinerary_user is pending

#   pending_users.each do |person|
#     new = ItineraryUser.new
#     new.itinerary = itinerary
#     new.user = person
#     new.message = Faker::Books::Dune.quote
#     new.save!
#   end

#   # interested_users.each do |person|
#   #   new = ItineraryUser.new
#   #   new.itinerary = itinerary
#   #   new.user = person
#   #   new.save!
#   # end
#   new = ItineraryUser.new
#   new.itinerary = itinerary
#   new.status = "accepted"
#   new.user = accepted_user
#   new.save!

#   itinerary.save!

#   chatroom.users << accepted_user
#   chatroom.users << organiser
#   chatroom.save!

#   # populate chatroom with some messages
#   5.times do
#     message = Message.new(
#       content: Faker::TvShows::StrangerThings.quote
#     )
#     message.chatroom = chatroom
#     message.user = organiser
#     message.save!
#   end

#   # assign itinerary_users
#     # every interested_user thats not organiser is a member





#   3.times do
#     event = Event.new(
#       title: Faker::Mountain.name,
#       description: Faker::Company.catch_phrase,
#       date_start: random_start_date,
#       date_end: random_end_date,
#       location: LOCATION_STRING.sample, # PROBLEM: my location is not a subset of itnerary title now
#       cost: (50..1000).to_a.sample
#     )
#     event.itinerary = itinerary
#     event.save!
#   end

#   5.times do
#     announcement = Announcement.new(
#       content: Faker::TvShows::GameOfThrones.quote
#     )
#     itinerary.announcements << announcement
#     announcement.save!
#   end

# end

# puts "Creating restrictions..."
# # creating itinerary_criteria – 1a) only women 1b) only men 2a) 20-30 y/o 2b) 30-40 y/o 2c) > 40 y/o
# first_restriction = Restriction.new(
#   title: "only women",
#   restricted_gender: "F"
# )
# first_restriction.save!

# second_restriction  = Restriction.new(
#   title: "only men",
#   restricted_gender: "M"
# )
# second_restriction.save!

# third_restriction = Restriction.new(
#   title: "20–30 year olds",
#   min_age: 20,
#   max_age: 30
# )
# third_restriction.save!

# fourth_restriction = Restriction.new(
#   title: "30-40 year olds",
#   min_age: 30,
#   max_age: 40
# )
# fourth_restriction.save!

# fifth_restriction = Restriction.new(
#   title: ">40 year old",
#   min_age: 0,
#   max_age: 40
# )
# fifth_restriction.save!

# # create itinerary_criteria
# Itinerary.all.each do |it|
#   itinerary_restriction = ItineraryRestriction.new
#   itinerary_restriction.description = Faker::Lorem.sentence(word_count: 20)
#   itinerary_restriction.itinerary = it
#   itinerary_restriction.restriction = Restriction.all.sample
#   itinerary_restriction.save!
# end

# puts "Done with all models"
