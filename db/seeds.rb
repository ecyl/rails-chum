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


# CODE YOUR USER IN HERE
jamieson = User.new(
  first_name: "Jamieson",
  last_name: "Walker",
  email: "jamieson@gmail.com",
  password: 12345678,
  age: 28,
  gender: "F",
  languages: "English"
)
file = URI.open("https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
jamieson.photo.attach(io: file, filename: "#{jamieson.email}-avatar")
jamieson.save

newyork = Itinerary.new(
  title: "2 days in New York",
  participant_limit: 5,
  description: "I wanna go where culture is ~ ladybird. Let's go see why ladybird was making such a fuss about new york.",
  published: false,
  destination: "New York",
  deadline: DateTime.new(2022, 8, 5, 12,0)
)
newyork.user = jamieson

nyc_chatroom = Chatroom.new(
  name: "2 days in New York"
)
nyc_chatroom.save!
newyork.chatroom = nyc_chatroom
newyork.save!

nyc_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
nyc_itinerary_user.user = jamieson
nyc_itinerary_user.itinerary = newyork
nyc_itinerary_user.save!

hamilton = Event.new(
  description: "Lets go watch the hamilton cast on broadway",
  cost: 340,
  location: "226 W 46th St, New York, NY 10036, United States",
  title: "Hamilton",
  date_start: DateTime.new(2022, 8, 6, 19,15),
  date_end: DateTime.new(2022, 8, 6, 22,15)
)
hamilton.itinerary = newyork
if hamilton.valid?
  hamilton.save!
end

kats = Event.new(
  description: "Eat a pastrami and rye sandwich from the iconic Kat's deli.",
  cost: 15,
  location: "Kat'z Delicatessen",
  title: "Pastrami and Rye at Katz",
  date_start: DateTime.new(2022, 8, 6, 13, 15),
  date_end: DateTime.new(2022, 8, 6, 14, 15)
)
kats.itinerary = newyork
if kats.valid?
  kats.save!
end

brooklyn = Event.new(
  description: "Let's go for a run across the brooklyn bridge",
  cost: 0,
  location: "Brooklyn bridge",
  title: "Smooth run at brooklyn bridge",
  date_start: DateTime.new(2022,8,8, 7,15),
  date_end: DateTime.new(2022,8,8,8,15)
)
brooklyn.itinerary = newyork
if brooklyn.valid?
  brooklyn.save!
end

central_park = Event.new(
  description: "Frolicking around central park. Catch some squirrels and maybe have a picnic.",
  cost:10,
  location: "Central Park",
  title: "Morning in central park",
  date_start: DateTime.new(2022,8,8,10),
  date_end: DateTime.new(2022,8,8,11,30)
)
central_park.itinerary = newyork
if central_park.valid?
  central_park.save!
end

newyork.published = true
newyork.save!


# Itinerary two
utah = Itinerary.new(
  title: "Traverse the utah state with me",
  participant_limit: 4,
  description: "Let's find out more about the unique state of utah and explore its beautiful natural scenery and canyons",
  published: false,
  destination: "Utah",
  deadline: DateTime.new(2022, 7, 10, 12, 0)
)
utah.user = jamieson
utah_chatroom = Chatroom.new(
  name: "Traverse the utah state with me"
)
utah_chatroom.save!
utah.chatroom = utah_chatroom
utah.save!

utah_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
utah_itinerary_user.user = jamieson
utah_itinerary_user.itinerary = utah
utah_itinerary_user.save!

zion_national = Event.new(
  description: "Explore red rock cliffs and waterfalls at zion national park. Get to see the amazing views being offered by zion canyon.",
  cost: 25,
  location: "Zion National Park",
  title: "Zion national park in Utah",
  date_start: DateTime.new(2022,10, 1, 8, 10),
  date_end: DateTime.new(2022, 10, 1, 16, 30)
)
zion_national.itinerary = utah
if zion_national.valid?
  zion_national.save!
end

monument_valley = Event.new(
  description: "Always wanted to imagine yourself in django unchained? Come with me to monument valley where the scenery is a scene right out of a tarantino movie.",
  cost: 0,
  location: "Monument Valley",
  title: "Experience the old west",
  date_start: DateTime.new(2022, 10, 2, 8, 10),
  date_end: DateTime.new(2022, 10, 2, 16, 30)
)
monument_valley.itinerary = utah
if monument_valley.valid?
  monument_valley.save!
end

soda_shop = Event.new(
  description: "Curious about soda shops in salt lake city? So am I! Let's go try some of the interesting sodas together.",
  cost: 10,
  location: "517 N 2000 W Marriott Slaterville, UT",
  title: "Pop in Utah.",
  date_start: DateTime.new(2022, 10, 3, 11, 30),
  date_end: DateTime.new(2022, 10, 3, 11, 50)
)
soda_shop.itinerary = utah
if soda_shop.valid?
  soda_shop.save!
end

temple_square = Event.new(
  description: "Curious about the church of jesus christ of the latter-day saints? Well me too. Let's go check out the symbolic heart of the church temple square.",
  cost: 5,
  location: "Temple Square",
  date_start: DateTime.new(2022, 10, 3, 12, 10),
  date_end: DateTime.new(2022, 10, 3, 13)
)
temple_square.itinerary = utah
if temple_square.valid?
  temple_square.save!
end

utah.published = true
utah.save!

# Itinerary 3
washington = Itinerary.new(
  title: "Washington state shenanigans",
  participant_limit: 4,
  description: "Liked twilight? House of cards? Let's visit the washington state together and see the iconic landmarks that make this state unique.",
  published: false,
  destination: "Washington",
  deadline: DateTime.new(2022, 11, 10, 12, 0)
)
washington.user = jamieson
washington_chatroom = Chatroom.new(
  name: washington.title
)
washington_chatroom.save!
washington.chatroom = washington_chatroom
washington.save!

washington_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
washington_itinerary_user.user = jamieson
washington_itinerary_user.itinerary = washington
washington_itinerary_user.save!

forks = Event.new(
  description: "Twilight lovers, you can't miss this. Lets go see where Edward bounced an apple off his foot.",
  cost: 50,
  location: "Forks",
  title: "Exploring little town forks.",
  date_start: DateTime.new(2022, 11, 18, 8),
  date_end: DateTime.new(2022, 11,18, 15)
)
forks.itinerary = washington
if forks.valid?
  forks.save!
end

lincoln_memorial = Event.new(
  description: "Let's go see the iconic abraham lincoln statue and learn more about this great historical figure",
  cost: 15,
  location: "Lincoln Memorial",
  title: "Abraham lincoln galore",
  date_start: DateTime.new(2022, 11, 19, 8),
  date_end: DateTime.new(2022, 11, 19, 9)
)
lincoln_memorial.itinerary = washington
if lincoln_memorial.valid?
  lincoln_memorial.save!
end

washington_monument = Event.new(
  description: "Read Dan Brown's book on the freemasons? You won't want to miss visiting this eye-catching structure.",
  cost: 0,
  location: "Washington Monument",
  title: "Washington monument exploration",
  date_start: DateTime.new(2022, 11, 19, 9, 30),
  date_end: DateTime.new(2022, 11, 19, 10)
)
washington_monument.itinerary = washington
if washington_monument.valid?
  washington_monument.save!
end

capitol_building = Event.new(
  description: "Lets go politician sightseeing. Maybe we'll catch some famous figures on the steps of the capitol",
  cost: 0,
  location: "Capitol Building",
  title: "Capitol building exploration",
  date_start: DateTime.new(2022, 11, 19, 10,15),
  date_end: DateTime.new(2022, 11, 19, 11,15)
)
capitol_building.itinerary = washington
if capitol_building.valid?
  capitol_building.save!
end

washington.published = true
washington.save!
