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

helen = User.new(
  first_name: "Helen",
  last_name: "Tan",
  email: "helentan@gmail.com",
  age: 21,
  gender: "F",
  password: 12345678,
  languages: "English, Chinese, UIUX"
)
helen.save!

germaine = User.new(
  first_name: "Germaine",
  last_name: "Wong",
  email: "germainewong@gmail.com",
  age: 21,
  gender: "F",
  password: 12345678,
  languages: "English, limited Chinese, GenZ"
)
germaine.save!

puts "Test user: Eunice, Helen, Germaine, Raymond created"

eunice = User.new(
  first_name: "Eunice",
  last_name: "Chin",
  email: "ecyl@gmail.com",
  age: 21,
  gender: "F",
  password: 12345678,
  languages: "Nonsense, English, basic Chinese"
)
eunice.save!

#  RAYMOND'S SEEDS
# RAYMOND
raymond = User.new(
  first_name: "Raymond",
  last_name: "Ong",
  email: "raymondong@gmail.com",
  password: 12345678,
  age: 18,
  gender: "M",
  languages: "English, Chinese, French"
)
raymond.save!

# Create Raymond's itinerary

date_start = Date.today() + 10

raymond_itinerary = Itinerary.new(
  title: "Summer in Korea",
  participant_limit: 3,
  description: "Superb time in Korea!",
  destination: "Korea",
  published: true,
  deadline: Date.today() + 5
)

# raymond_notification1 = Notification.new(
#   user: raymond,

# )

chatroom = Chatroom.new(
  name: "Summer in Korea"
)

raymond_itinerary.user = raymond
chatroom.save!
raymond_itinerary.chatroom = chatroom
raymond_itinerary.save!

raymond_event1 = Event.new(
  description: "Lotte World for fun people",
  address: "Lotte World",
  location: "Lotte World",
  title: "Fun night at Lotte World",
  cost: 50,
  date_start: date_start + 11,
  date_end: date_start + 12
)

raymond_event1.itinerary = raymond_itinerary
raymond_event1.save!

raymond_event2 = Event.new(
  description: "Blackpink Concert with the Blinks",
  address: "Korea DMZ",
  location: "Korea DMZ",
  title: "Super electrifying concert atmosphere!",
  cost: 300,
  date_start: date_start + 12,
  date_end: date_start + 13
)

raymond_event2.itinerary = raymond_itinerary
raymond_event2.save!

raymond_event3 = Event.new(
  description: "Bask in the busking culture, cheap and nice clothes, and some really good Korean BBQ",
  address: "Hongdae",
  location: "Hongdae",
  title: "Eat, shop, repeat",
  cost: 10,
  date_start: date_start + 13,
  date_end: date_start + 14
)

raymond_event3.itinerary = raymond_itinerary
raymond_event3.save!

# SUANSEN
suansen = User.new(
  first_name: "Suan Sen",
  last_name: "Tan",
  email: "suansen@gmail.com",
  password: 12345678,
  age: 14,
  gender: "M",
  languages: "English, Chinese"
)
file = URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80")
suansen.photo.attach(io: file, filename: "#{suansen.email}-avatar")
suansen.save

suansen_date_start = Date.today() + 20

suansen_itinerary = Itinerary.new(
  title: "Trip to Germany",
  participant_limit: 3,
  description: "I've visited Germany many times, trust me!",
  destination: "Germany",
  published: true,
  deadline: suansen_date_start + 5
)

# raymond_notification1 = Notification.new(
#   user: raymond,

# )

chatroom = Chatroom.new(
  name: "Trip to Germany"
)

suansen_itinerary.user = suansen
chatroom.save!
suansen_itinerary.chatroom = chatroom
suansen_itinerary.save!

suansen_event1 = Event.new(
  description: "Dresden Royal Palace for the cultured people",
  address: "Dresden Royal Palace",
  location: "Dresden Royal Palace",
  title: "Enriching time at the Dresden Royal Palace",
  cost: 50,
  date_start: suansen_date_start + 11,
  date_end: suansen_date_start + 12
)

suansen_event1.itinerary = suansen_itinerary
suansen_event1.save!

suansen_event2 = Event.new(
  description: "Dresden Transport Museum – super interesting history!",
  address: "Dresden Transport Museum",
  location: "Dresden Transport Museum",
  title: "Dresden Transport Museum!",
  cost: 300,
  date_start: suansen_date_start + 12,
  date_end: suansen_date_start + 13
)

suansen_event2.itinerary = suansen_itinerary
suansen_event2.save!

suansen_event3 = Event.new(
  description: "Enjoy the serenity of the Frankfurt Cathedral",
  address: "Frankfurt Cathedral",
  location: "Frankfurt Cathedral",
  title: "Good Hollywood filming location",
  cost: 10,
  date_start: suansen_date_start + 13,
  date_end: suansen_date_start + 14
)

suansen_event3.itinerary = suansen_itinerary
suansen_event3.save!

# HARDCODE NOTIFICATION (SO NOTIFICATION DROPDOWN WONT BE EMPTY) -- DO NOT DELETE PLEASE
# hardcode_notification = Notification.new(
#   user: raymond,
#   content: " has accepted your request to join the itinerary. Click to view.",
#   itinerary: suansen_itinerary,
#   notification_type: "request_accepted"
# )
# hardcode_initiator = NotificationInitiator.new(
#   user: suansen,
#   itinerary: suansen_itinerary,
#   notification: hardcode_notification
# )

# hardcode_notification.save!


# GERMAINE

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
  description: "I wanna go where culture is ~ ladybird. Let's go see why ladybirdI was making such a fuss about new york.",
  published: false,
  destination: "New York",
  deadline: DateTime.new(2022, 8, 5, 12,0)
)
newyork.user = jamieson
file = URI.open("https://images.unsplash.com/photo-1518391846015-55a9cc003b25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
newyork.photo.attach(io: file, filename: "newyork")

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
file = URI.open("https://images.unsplash.com/photo-1568650436496-a2a288c7be3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
hamilton.photo.attach(io: file, filename: "hamilton")

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
file = URI.open("https://images.unsplash.com/photo-1548528761-ce696bd1b70d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80")
kats.photo.attach(io: file, filename: "katz-deli")
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
file = URI.open("https://images.unsplash.com/photo-1578059474177-88fb974a2d15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80")
brooklyn.photo.attach(io: file, filename: "brooklyn")
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
file = URI.open("https://images.unsplash.com/photo-1631729779674-1f369e1116b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2012&q=80")
central_park.photo.attach(io: file, filename: "Central-park")
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
file = URI.open("https://images.unsplash.com/photo-1504281490492-090c5c169650?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80")
utah.photo.attach(io: file, filename: "utah")
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
file = URI.open("https://images.unsplash.com/photo-1584528606063-2d14ed9b26a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80")
zion_national.photo.attach(io: file, filename: "zion-national")
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
file = URI.open("https://images.unsplash.com/photo-1480004902249-cdb28d6a01a4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2211&q=80")
monument_valley.photo.attach(io: file, filename: "monument_valley")
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
file = URI.open("https://images.unsplash.com/photo-1602361063465-0cf8b388a257?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80")
soda_shop.photo.attach(io: file, filename: "soda-saltlake")
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
file = URI.open("https://images.unsplash.com/photo-1561475463-bf5feec154a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=989&q=80")
temple_square.photo.attach(io: file, filename: "temple_square")
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
file = URI.open("https://images.unsplash.com/photo-1543107076-8f86ee268706?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2128&q=80")
washington.photo.attach(io: file, filename: "Washington_state")
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
file = URI.open("https://images.unsplash.com/photo-1623281857914-60b90678a296?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
forks.photo.attach(io: file, filename: "forks_washington")
if forks.valid?
  forks.save!
end

space_needle = Event.new(
  description: "Calling all greys anatomy lovers.",
  cost: 15,
  location: "400 Broad St, Seattle, WA 98109, United States",
  title: "Space needle and fairy boats",
  date_start: DateTime.new(2022, 11, 19, 8),
  date_end: DateTime.new(2022, 11, 19, 9)
)
space_needle.itinerary = washington
file = URI.open("https://images.unsplash.com/photo-1438401171849-74ac270044ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2235&q=80")
space_needle.photo.attach(io: file, filename: "space_needle")
if space_needle.valid?
  space_needle.save!
end

mount_rainier = Event.new(
  description: "Spend some time in the great outdoors. We can hike and see the spectacular views of mount rainier.",
  cost: 0,
  location: "Mount Rainier",
  title: "Hiking at mount rainier",
  date_start: DateTime.new(2022, 11, 19, 9, 30),
  date_end: DateTime.new(2022, 11, 19, 10)
)
file = URI.open('https://images.unsplash.com/photo-1549769311-eb1f5f68d838?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')
mount_rainier.photo.attach(io: file, filename: "mount_rainier")
mount_rainier.itinerary = washington
if mount_rainier.valid?
  mount_rainier.save!
end
washington.published = true
washington.save!
