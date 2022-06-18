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

file = URI.open("https://kitt.lewagon.com/placeholder/users/helen-tan")
helen.photo.attach(io: file, filename: "#{helen.email}-avatar")
helen.save

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
file = URI.open("https://avatars.githubusercontent.com/u/64523208?v=4")
germaine.photo.attach(io: file, filename: "#{germaine.email}-avatar")
germaine.save

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
file = URI.open("https://kitt.lewagon.com/placeholder/users/ecyl")
eunice.photo.attach(io: file, filename: "#{eunice.email}-avatar")
eunice.save

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

file = URI.open("https://kitt.lewagon.com/placeholder/users/rayjosong")
raymond.photo.attach(io: file, filename: "#{raymond.email}-avatar")
raymond.save

# Create Raymond's itinerary


raymond_itinerary1 = Itinerary.new(
  title: "Summer in Korea",
  participant_limit: 3,
  description: "Superb time in Korea!",
  destination: "Korea",
  published: true,
  deadline: DateTime.new(2022, 7, 1, 12, 10)
)

file = URI.open("https://images.unsplash.com/photo-1517154421773-0529f29ea451?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
raymond_itinerary1.photo.attach(io: file, filename: "#{raymond_itinerary1.destination}-itinerary")
raymond_itinerary1.save

# raymond_notification1 = Notification.new(
#   user: raymond,

# )

chatroom = Chatroom.new(
  name: "Summer in Korea"
)

raymond_itinerary1.user = raymond
chatroom.save!
raymond_itinerary1.chatroom = chatroom
raymond_itinerary1.save!

raymond_event1 = Event.new(
  description: "Lotte World for fun people",
  address: "Lotte World",
  location: "Lotte World",
  title: "Fun night at Lotte World",
  cost: 50,
  date_start: DateTime.new(2022, 7, 20, 12, 10),
  date_end: DateTime.new(2022, 7, 20, 19, 30)
)

raymond_event1.itinerary = raymond_itinerary1
raymond_event1.save!

file = URI.open("https://res.klook.com/image/upload/c_crop,h_517,w_1080,x_0,y_346/c_fill,w_960,h_460,f_auto/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/jltoiwissz7gqaus1bdi.webp")
raymond_event1.photo.attach(io: file, filename: "#{raymond_event1.location}-event")
raymond_event1.save

raymond_event2 = Event.new(
  description: "Blackpink Concert with the Blinks",
  address: "Korea DMZ",
  location: "Korea DMZ",
  title: "Super electrifying concert atmosphere!",
  cost: 300,
  date_start: DateTime.new(2022, 7, 21, 18, 10),
  date_end: DateTime.new(2022, 7, 21, 22, 10)
)

raymond_event2.itinerary = raymond_itinerary1
raymond_event2.save!

raymond_event3 = Event.new(
  description: "Bask in the busking culture, cheap and nice clothes, and some really good Korean BBQ",
  address: "Hongdae",
  location: "Hongdae",
  title: "Eat, shop, repeat",
  cost: 50,
  date_start: DateTime.new(2022, 7, 22, 15, 30),
  date_end: DateTime.new(2022, 7, 22, 20, 30)
)

raymond_event3.itinerary = raymond_itinerary1
raymond_event3.save!

raymond_event4 = Event.new(
  description: "Offering great views over Seoul this 342m, Bukaksan is a worthy location for those wanting to challenge themselves",
  address: "Bukaksan",
  location: "Bukaksan",
  title: "Let's sweat it out together now that we've feasted so much!",
  cost: 10,
  date_start: DateTime.new(2022, 7, 23, 9, 30),
  date_end: DateTime.new(2022, 7, 23, 12, 30)
)

raymond_event4.itinerary = raymond_itinerary1
raymond_event4.save!

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

file = URI.open("https://images.unsplash.com/photo-1554072675-66db59dba46f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80")
suansen.photo.attach(io: file, filename: "#{suansen_itinerary.title}-itinerary")
suansen.save

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



# RAYMOND

## Raymond - Itinerary one

jisoo = User.new(
  first_name: "Kim",
  last_name: "Jisoo",
  email: "kimjisoo@gmail.com",
  password: 12345678,
  age: 27,
  gender: "F",
  languages: "Korean, English, Japanese"
)

file = URI.open("https://kprofiles.com/wp-content/uploads/2017/06/images-1.jpeg")
jisoo.photo.attach(io: file, filename: "#{jisoo.email}-avatar")
jisoo.save

jeju = Itinerary.new(
  title: "Observe the beauty of this natural sanctuary with pure air",
  participant_limit: 6,
  description: "There's nothing like being in Jeju, people here boast of living a long age due to the stressful environment",
  published: false,
  destination: "Jeju Island",
  deadline: DateTime.new(2022, 8, 10, 12, 0)
)

file = URI.open("https://images.unsplash.com/photo-1596941248238-0d49dcaa4263?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
jeju.photo.attach(io: file, filename: "#{jeju.destination}-itinerary")

jeju.user = jisoo
jeju_chatroom = Chatroom.new(
  name: "Observe the beauty of this natural sanctuary with pure air",
)

jeju_chatroom.save!
jeju.chatroom = jeju_chatroom
jeju.save!

jeju_itinerary_user = ItineraryUser.new(
  status: "organiser",
  user: jisoo,
  itinerary: jeju
)
jeju_itinerary_user.save!

mount_hallasan = Event.new(
  description: "Located in the centre of Jeju Island, Mount Hallasan is a dormant volcano that’s been declared a UNESCO World Natural Heritage Site. ",
  cost: 12,
  location: "Mount Hallasan",
  title: "Mount Hallasan in Jeju",
  date_start: DateTime.new(2022, 10, 5, 14, 10),
  date_end: DateTime.new(2022, 10, 5, 19, 10)
)

mount_hallasan.itinerary = jeju
mount_hallasan.save! if mount_hallasan.valid?

cheonjeyeon_waterfalls = Event.new(
  description: "",
  cost: 15,
  location: "Cheonjeyeon Waterfalls",
  title: "Cheonjeyeon Waterfalls – Paradise for nature lovers",
  date_start: DateTime.new(2022, 10, 6, 14, 0),
  date_end: DateTime.new(2022, 10, 6, 16, 0)
)

cheonjeyeon_waterfalls.itinerary = jeju
cheonjeyeon_waterfalls.save! if cheonjeyeon_waterfalls.valid?

jeju_waterworld = Event.new(
  description: "",
  cost: 26,
  location: "Jeju Waterworld",
  title: "Time for a splash! @ Jeju Waterworld",
  date_start: DateTime.new(2022, 10, 7, 15, 5),
  date_end: DateTime.new(2022, 10, 7, 18, 5)
)

jeju_waterworld.itinerary = jeju
jeju_waterworld.save! if jeju_waterworld.valid?

jeju.published = true
jeju.save!

## Raymond - Itinerary two

# busan tower, gamcheon culture village, jagalchi fish market, gwangbokdong food street

jennie = User.new(
  first_name: "Kim",
  last_name: "Jennie",
  email: "jenniekim@gmail.com",
  age: 26,
  gender: "F",
  password: 12345678,
  languages: "Korean, English, French, Chinese, Japanese"
)

file = URI.open("https://qph.fs.quoracdn.net/main-qimg-c4ea2c5062f87b6069d445774394dfe7")
jennie.photo.attach(io: file, filename: "#{jennie.email}-avatar")
jennie.save!

busan = Itinerary.new(
  title: "Forget train to Busan, we are going to have a great time!",
  participant_limit: 6,
  description: "From beautiful beaches and succulent seafood to traditional markets and mural villages, Busan is a must-visit.",
  published: false,
  destination: "Busan",
  deadline: DateTime.new(2022, 9, 8, 12, 0)
)

busan.user = jennie
busan_chatroom = Chatroom.new(
  name: "Forget train to Busan, we are going to have a great time!"
)

busan_chatroom.save!
busan.chatroom = busan_chatroom
busan.save!

file = URI.open("https://images.unsplash.com/photo-1575907794679-016b6bd90285?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80")
busan.photo.attach(io: file, filename: "#{busan.destination}-itinerary")
busan.save!

busan_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
busan_itinerary_user.user = jennie
busan_itinerary_user.itinerary = busan
busan_itinerary_user.save!

busan_tower = Event.new(
  description: "Enjoy the exhilirating beauty of Busan from Busan Tower",
  cost: 30,
  location: "Busan Tower",
  title: "Explore Busan Tower",
  date_start: DateTime.new(2022, 11, 1, 8, 10),
  date_end: DateTime.new(2022, 11, 1, 16, 30)
)
busan_tower.itinerary = busan
if busan_tower.valid?
  busan_tower.save!
end

haeundae_beach = Event.new(
  description: "A ridiculously gorgeous beach that you can barely believe is at the edge of such a massive city.",
  cost: 30,
  location: "Haeundae Beach",
  title: "One of South Korea's most beautiful beaches",
  date_start: DateTime.new(2022, 11, 2, 8, 10),
  date_end: DateTime.new(2022, 11, 2, 12, 30)
)
haeundae_beach.itinerary = busan
if haeundae_beach.valid?
  haeundae_beach.save!
end

gamcheon_culture_village = Event.new(
  description: "A stunning, kaleidoscopically coloured village. If it had the means, your Instagram would pat you on the back for the gift of this picture.",
  cost: 30,
  location: "Gamcheon Culture Village",
  title: "A stunning, kaleidoscopically coloured village",
  date_start: DateTime.new(2022, 11, 3, 14, 10),
  date_end: DateTime.new(2022, 11, 3, 17, 30)
)
gamcheon_culture_village.itinerary = busan
if gamcheon_culture_village.valid?
  gamcheon_culture_village.save!
end

busan.published = true
busan.save!

## Raymond - Itinerary three
chaeyoung = User.new(
  first_name: "Park",
  last_name: "Chaeyoung",
  email: "parkchaeyoung@gmail.com",
  password: 12345678,
  age: 25,
  gender: "F",
  languages: "Korean, English, Japanese"
)

seoul_tour = Itinerary.new(
  title: "Cafe hopping, KBBQ and more in South Korea",
  participant_limit: 5,
  description: "You've never truly been to South Korea if you haven't done these things in my itinerary!",
  published: false,
  destination: "Busan",
  deadline: DateTime.new(2022, 9, 8, 12, 0)
)

seoul_tour.user = chaeyoung
seoul_tour_chatroom = Chatroom.new(
  name: "Cafe hopping, KBBQ and more in South Korea"
)

seoul_tour_chatroom.save!
seoul_tour.chatroom = seoul_tour_chatroom

seoul_tour_itinerary_user = ItineraryUser.new(
  status: "organiser"
)

seoul_tour_itinerary_user.user = chaeyoung
seoul_tour_itinerary_user.itinerary = seoul_tour
seoul_tour_itinerary_user.save!

seoul_tour.save!

file = URI.open("https://images.unsplash.com/photo-1597552661064-af143a5f3bee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
seoul_tour.photo.attach(io: file, filename: "#{seoul_tour.destination}-itinerary")
seoul_tour.save!

myeong_dong = Event.new(
  description: "Explore food and shopping places in Myeong-dong",
  cost: 60,
  location: "Myeong-dong",
  title: "Trip to Myeong-dong",
  date_start: DateTime.new(2022, 12, 1, 18, 10),
  date_end: DateTime.new(2022, 10, 1, 21, 30)
)
myeong_dong.itinerary = seoul_tour
if myeong_dong.valid?
  myeong_dong.save!
end

namdaemun = Event.new(
  description: "Shake Shack at Namdaemun, then shopping for more clothes",
  cost: 30,
  location: "Namdaemun",
  title: "Shake Shack at Namdaemun",
  date_start: DateTime.new(2022, 12, 2, 18, 10),
  date_end: DateTime.new(2022, 10, 2, 21, 30)
)

namdaemun.itinerary = seoul_tour
if namdaemun.valid?
  namdaemun.save!
end

bukcheon_hanok_village = Event.new(
  description: "Cultural tour & immeresing yourself in rural life",
  cost: 15,
  location: "Bukchon Hanok Village",
  title: "Take a break from city life @ Bukchon Hanok Village",
  date_start: DateTime.new(2022, 12, 3, 10, 10),
  date_end: DateTime.new(2022, 10, 3, 13, 30)
)

bukcheon_hanok_village.itinerary = seoul_tour
if bukcheon_hanok_village.valid?
  bukcheon_hanok_village.save!
end

seoul_tour.published = true
seoul_tour.save!

# Helen

puts "––––––––––––––––––––––––––CREATING JAPAN ITINERARIES––––––––––––––––––––––––––"
# Itinerery 1
puts "A CLIMBING TRIP TO MIZUGAKI:"
# puts "Creating a user - Florence..."
# florenceloy = User.new(
#   first_name: "Florence",
#   last_name: "Loy",
#   email: "florenceloy@gmail.com",
#   password: 12345678,
#   age: 27,
#   gender: "F",
#   languages: "English, Chinese"
# )
# file = URI.open("https://source.unsplash.com/cOe0L1Yp2UA")
# florenceloy.photo.attach(io: file, filename: "#{florenceloy.email}-avatar")
# florenceloy.save
# puts "User Florence created"

puts "Creating Itinerary: 'A Climbing Trip to Mizugaki'..."
mtmizugaki = Itinerary.new(
  title: "A Climbing Trip to Mizugaki",
  participant_limit: 5,
  description: "Mt. Mizugaki has become a popular destination for rock climbing for climbers from all around the world.
                Mizugaki-yama Natural Park, which has a campground and a large parking lot, offers convenient access to
                climbs such as Kanmanboron, Ohzura-iwa rock, Kozura-iwa rock, and Toichimen-iwa (or Juichimen-iwa) rock.
                Hoping to go on this trip with 5 other experienced climbers. If you are new to climbing, and are interested,
                drop me a message and maybe we can work something out!",
  published: false,
  destination: "Japan",
  deadline: DateTime.new(2022, 7, 20, 12, 0, 0)
)

mtmizugaki.user = raymond

mtmizugaki_chatroom = Chatroom.new(
  name: "A Climbing Trip to Mizugaki"
)

mtmizugaki_chatroom.save!
mtmizugaki.chatroom = mtmizugaki_chatroom
mtmizugaki_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
mtmizugaki_itinerary_user.user = raymond
mtmizugaki_itinerary_user.itinerary = mtmizugaki
mtmizugaki_itinerary_user.save!
puts "Itinerary 'A Climbing Trip to Mizugaki' was created"

puts "Creating events for 'A Climbing Trip to Mizugaki'..."
bus_journey = Event.new(
  description: "Let's take this day to relax and explore Tokyo",
  cost: 200,
  location: "2 Chome-6-2 Yoyogi, Shibuya City, Tokyo 151-0053, Japan",
  title: "Day 1 R&R and explore city",
  date_start: DateTime.new(2022, 9, 10, 9, 0),
  date_end: DateTime.new(2022, 9, 10, 18, 0)
)
bus_journey.itinerary = mtmizugaki
if bus_journey.valid?
  bus_journey.save!
end
puts "1 event created"

mizugaki_camping = Event.new(
  description: "We will set up camp here",
  cost: 340,
  location: "8862-1 Sutamacho Obi, Hokuto, Yamanashi 408-0101, Japan",
  title: "Set up camp @ Mizugakiyamashizen Koen Camping Ground",
  date_start: DateTime.new(2022, 9, 11, 9, 0),
  date_end: DateTime.new(2022, 9, 11, 12, 0)
)
mizugaki_camping.itinerary = mtmizugaki
if mizugaki_camping.valid?
  mizugaki_camping.save!
end
puts "2 events created"

climbing_time = Event.new(
  description: "Today, we spend the whole day climbing at Mt Mizugaki",
  cost: 100,
  location: "Sutamacho Obi, Hokuto, Yamanashi 408-0101, Japan",
  title: "It's climbing time",
  date_start: DateTime.new(2022, 9, 12, 9, 0),
  date_end: DateTime.new(2022, 9, 12, 20, 0)
)
climbing_time.itinerary = mtmizugaki
if climbing_time.valid?
  climbing_time.save!
end
puts "3 events created"

mizugaki_sansou = Event.new(
  description: "Stay at Mizugaki-sansou",
  cost: 100,
  location: "8861 Sutamacho Obi, Hokuto, Yamanashi 408-0101, Japan",
  title: "Stay at Mizugaki-Sansou (guesthouse)",
  date_start: DateTime.new(2022,9,13, 9,0),
  date_end: DateTime.new(2022,9,13,20,0)
)
mizugaki_sansou.itinerary = mtmizugaki
if mizugaki_sansou.valid?
  mizugaki_sansou.save!
end
puts "4 events created"

mtmizugaki.published = true
mtmizugaki.save!

puts "Events for 'A Climbing Trip to Mizugaki' were created"

# Itinerary 2
puts "QUICK 3D2N TOKYO GETAWAY:"
puts "Creating a user - Kenny..."
kennywong = User.new(
  first_name: "Kenny",
  last_name: "Wong",
  email: "kennywong@gmail.com",
  password: 12345678,
  age: 27,
  gender: "M",
  languages: "English, Chinese"
)
file = URI.open("https://kitt.lewagon.com/placeholder/users/cookinlima")
kennywong.photo.attach(io: file, filename: "#{kennywong.email}-avatar")
kennywong.save
puts "User Kenny created"

puts "Creating Itinerary: 'Quick 3D2N Tokyo Getaway'..."
tokyogetaway = Itinerary.new(
  title: "Quick 3D2N Tokyo Getaway",
  participant_limit: 2,
  description: "Is anyone interested in going for a weekend trip to Tokyo in Auguest?
                I'm open to having 2 more people join me on this trip!",
  published: false,
  destination: "Japan",
  deadline: DateTime.new(2022, 7, 20, 12, 0, 0)
)

tokyogetaway.user = kennywong;

tokyogetaway_chatroom = Chatroom.new(
  name: "Quick 3D2N Tokyo Getaway"
)

tokyogetaway_chatroom.save!
tokyogetaway.chatroom = tokyogetaway_chatroom
tokyogetaway_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
tokyogetaway_itinerary_user.user = kennywong
tokyogetaway_itinerary_user.itinerary = tokyogetaway
tokyogetaway_itinerary_user.save!
puts "Itinerary 'Quick 3D2N Tokyo Getaway' was created"

puts "Creating events for 'Quick 3D2N Tokyo Getaway'..."
tokyo_station = Event.new(
  description: "Explore the area around the the historic Tokyo Station",
  cost: 100,
  location: "1 Chome Marunouchi, Chiyoda City, Tokyo 100-0005, Japan",
  title: "Tokyo Station",
  date_start: DateTime.new(2022, 8, 20, 9, 0),
  date_end: DateTime.new(2022, 8, 20, 14, 0)
)
tokyo_station.itinerary = tokyogetaway
if tokyo_station.valid?
  tokyo_station.save!
end
puts "1 event created"

imperial_palace = Event.new(
  description: "Let's explore the nearby Tokyo Imperial Palace",
  cost: 100,
  location: "1-1 Chiyoda, Chiyoda City, Tokyo 100-8111, Japan",
  title: "Tokyo Imperial Palace",
  date_start: DateTime.new(2022, 8, 20, 14, 0),
  date_end: DateTime.new(2022, 8, 20, 16, 0)
)
imperial_palace.itinerary = tokyogetaway
if imperial_palace.valid?
  imperial_palace.save!
end
puts "2 events created"

sensoji = Event.new(
  description: "Let's visit the oldest Buddhist temple in Tokyo.",
  cost: 10,
  location: "2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan",
  title: "Senso-ji Temple",
  date_start: DateTime.new(2022, 8, 21, 9, 0),
  date_end: DateTime.new(2022, 8, 21, 12, 0)
)
sensoji.itinerary = tokyogetaway
if sensoji.valid?
  sensoji.save!
end
puts "3 events created"

tsutaya = Event.new(
  description: "Relax at this aesthetic looking bookstore",
  cost: 100,
  location: "17-5 Sarugaku-cho, Shibuya-ku, Tokyo 150-0033",
  title: "Tsutaya Books Daikanyama",
  date_start: DateTime.new(2022, 8, 22, 9, 0),
  date_end: DateTime.new(2022, 8, 22, 12, 0)
)
tsutaya.itinerary = tokyogetaway
if tsutaya.valid?
  tsutaya.save!
end
puts "4 events created"

tokyogetaway.published = true
tokyogetaway.save!

puts "Events for 'Quick 3D2N Tokyo Getaway' were created"

# Itinerary 3
puts "OSAKA ADVENTURE:"
puts "Creating a user - Ashley..."
ashleyyeo = User.new(
  first_name: "Ashley",
  last_name: "Yeo",
  email: "ashleyyeo@gmail.com",
  password: 12345678,
  age: 25,
  gender: "M",
  languages: "English, Chinese"
)
file = URI.open("https://kitt.lewagon.com/placeholder/users/ashignyeo")
ashleyyeo.photo.attach(io: file, filename: "#{ashleyyeo.email}-avatar")
ashleyyeo.save
puts "User Ashley created"

puts "Creating Itinerary: 'Osaka Adventure'..."
osaka = Itinerary.new(
  title: "Osaka Adventure",
  participant_limit: 2,
  description: "Is anyone interested in going for a weekend trip to Osaka in Auguest?
                I'm open to having 2 more people join me on this trip!",
  published: false,
  destination: "Japan",
  deadline: DateTime.new(2022, 7, 20, 12, 0, 0)
)

osaka.user = ashleyyeo;

osaka_chatroom = Chatroom.new(
  name: "Osaka Adventure"
)

osaka_chatroom.save!
osaka.chatroom = osaka_chatroom
osaka_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
osaka_itinerary_user.user = ashleyyeo
osaka_itinerary_user.itinerary = osaka
osaka_itinerary_user.save!
puts "Itinerary 'Osaka Adventure' was created"


puts "Creating events for 'Osaka Adventure'..."
cat_cafe = Event.new(
  description: "Let's play with cute kitties",
  cost: 20,
  location: "3 Chome-1-24 Higashinakahama, Joto Ward, Osaka, 536-0023, Japan",
  title: "Neko no Jikan",
  date_start: DateTime.new(2022, 8, 20, 9, 0),
  date_end: DateTime.new(2022, 8, 20, 12, 0)
)
cat_cafe.itinerary = osaka
if cat_cafe.valid?
  cat_cafe.save!
end
puts "1 event created"

cat_cafe = Event.new(
  description: "Let's play with cute kitties",
  cost: 20,
  location: "3 Chome-1-24 Higashinakahama, Joto Ward, Osaka, 536-0023, Japan",
  title: "Neko no Jikan",
  date_start: DateTime.new(2022, 8, 20, 9, 0),
  date_end: DateTime.new(2022, 8, 20, 12, 0)
)
cat_cafe.itinerary = osaka
if cat_cafe.valid?
  cat_cafe.save!
end
puts "2 events created"

tsubomi = Event.new(
  description: "Coffee time",
  cost: 50,
  location: "1-8 Rokumantaicho, Tennoji Ward, Osaka, 543-0074, Japan",
  title: "Tsubomi Coffee",
  date_start: DateTime.new(2022, 8, 21, 9, 0),
  date_end: DateTime.new(2022, 8, 21, 12, 0)
)
tsubomi.itinerary = osaka
if tsubomi.valid?
  tsubomi.save!
end
puts "3 events created"

denden = Event.new(
  description: "Shopping for tech stuff",
  cost: 200,
  location: "Nipponbashi, Naniwa-ku, Osaka-shi, Osaka 3-5, 556-0005",
  title: "Nipponbashi Den Den Town",
  date_start: DateTime.new(2022, 8, 22, 9, 0),
  date_end: DateTime.new(2022, 8, 22, 20, 0)
)
denden.itinerary = osaka
if denden.valid?
  denden.save!
end
puts "4 events created"

osaka.published = true
osaka.save!

puts "Events for 'Osaka Adventure' were created"

# Eunice

puts "––––––––––––––––––––––––––CREATING BALI ITINERARIES––––––––––––––––––––––––––"
# Itinerery 1
puts "A SURFING TRIP TO KUTA BEACH:"
puts "Creating a user - Justinn..."
justinnleong = User.new(
  first_name: "Justinn",
  last_name: "Leong",
  email: "justinnleong@gmail.com",
  password: 12345678,
  age: 32,
  gender: "M",
  languages: "English, Chinese"
)
file = URI.open("https://kitt.lewagon.com/placeholder/users/justinnjamesleong")
justinnleong.photo.attach(io: file, filename: "#{justinnleong.email}-avatar")
justinnleong.save
puts "User Justinn created"

puts "Creating Itinerary: '2D1N Surf Trip to Kuta Beach'..."
kutabeach= Itinerary.new(
  title: "2D1N Surf Trip to Kuta Beach",
  participant_limit: 3,
  description: "Kuta Beach is one of the best places to enjoy Bali’s famous sunsets.
                Located on the island’s southwestern coast, we will be surfing all day long!",
  published: false,
  destination: "Indonesia",
  deadline: DateTime.new(2022, 7, 23, 12, 0, 0)
)

kutabeach.user = justinnleong;

kutabeach_chatroom = Chatroom.new(
  name: "2D1N Surf Trip to Kuta Beach"
)

kutabeach_chatroom.save!
kutabeach.chatroom = kutabeach_chatroom
kutabeach_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
kutabeach_itinerary_user.user = justinnleong
kutabeach_itinerary_user.itinerary = kutabeach
kutabeach_itinerary_user.save!
puts "Itinerary '2D1N Surf Trip to Kuta Beach' was created"

puts "Creating events for '2D1N Surf Trip to Kuta Beach'..."
surf = Event.new(
  description: "Waves are gonna be so perfect for surfing especially for beginners. Don't worry about not having a surfboard
                because there are many rental shops nearby.",
  cost: 20,
  location: "Jl. Pantai Kuta No.99, Legian, Kec. Kuta, Kabupaten Badung, Bali 80361, Indonesia",
  title: "Surf Day 1",
  date_start: DateTime.new(2022, 8, 8, 9, 0),
  date_end: DateTime.new(2022, 8, 8, 15, 0)
)
surf.itinerary = kutabeach
if surf.valid?
  surf.save!
end
puts "1 event created"

dinner_one = Event.new(
  description: "We will be having a nice sunset dinner along the beach",
  cost: 50,
  location: "Beachwalk Shopping Center, Jl. Pantai Kuta, Kuta, Kec. Kuta, Kabupaten Badung, Bali 80361, Indonesia",
  title: "Dinner with a sunset view along the beach",
  date_start: DateTime.new(2022, 8, 8, 18, 0),
  date_end: DateTime.new(2022, 8, 8, 22, 0)
)
dinner_one.itinerary = kutabeach
if dinner_one.valid?
  dinner_one.save!
end
puts "2 events created"

surf_again = Event.new(
  description: "Today, will be the second day and sadly the last day where we will catch some awesome waves",
  cost: 20,
  location: "Jl. Pantai Kuta, Kuta, Kec. Kuta, Kabupaten Badung, Bali 80361, Indonesia",
  title: "Surf Day 2",
  date_start: DateTime.new(2022, 8, 9, 9, 0),
  date_end: DateTime.new(2022, 8, 9, 15, 0)
)
surf_again.itinerary = kutabeach
if surf_again.valid?
  surf_again.save!
end
puts "3 events created"

puts "Completed creating itinerary: '2D1N Surf Trip to Kuta Beach'"

# Itinerary 2
puts "RELAXING 3D2N UBUD RETREAT:"

puts "Creating Itinerary: 'Relaxing 3D2N Ubud Retreat'..."
ubud_retreat = Itinerary.new(
  title: "Relaxing 3D2N Ubud Retreat",
  participant_limit: 4,
  description: "It has been a very stressfull month and I have planned this beautiful
                Ubud retreat to just detox and relax the mind.",
  published: false,
  destination: "Indonesia",
  deadline: DateTime.new(2022, 6, 30, 12, 0, 0)
)

ubud_retreat.user = eunice

ubud_retreat_chatroom = Chatroom.new(
  name: "Relaxing 3D2N Ubud Retreat"
)

ubud_retreat_chatroom.save!
ubud_retreat.chatroom = ubud_retreat_chatroom
ubud_retreat_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
ubud_retreat_itinerary_user.user = eunice
ubud_retreat_itinerary_user.itinerary = ubud_retreat
ubud_retreat_itinerary_user.save!
puts "Itinerary 'Relaxing 3D2N Ubud Retreat' was created"

puts "Creating events for 'Relaxing 3D2N Ubud Retreat'..."
yoga = Event.new(
  description: "Relax the body and mind by doing some relaxing yoga at Ubud's most popular yoga studio",
  cost: 20,
  location: "Jl. Hanoman Jl. Raya Pengosekan Ubud, Peliatan, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571, Indonesia",
  title: "Yoga",
  date_start: DateTime.new(2022, 7, 2, 9, 0),
  date_end: DateTime.new(2022, 7, 2, 10, 0)
)
yoga.itinerary = ubud_retreat
if yoga.valid?
  yoga.save!
end
puts "1 event created"

lunch = Event.new(
  description: "Let's have a nice healthy lunch after class",
  cost: 25,
  location: "Jl. Jembawan, Ubud, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571, Indonesia",
  title: "Healthy Lunch",
  date_start: DateTime.new(2022, 7, 2, 12, 0),
  date_end: DateTime.new(2022, 7, 2, 14, 0)
)
lunch.itinerary = ubud_retreat
if lunch.valid?
  lunch.save!
end
puts "2 events created"

monkey_forest = Event.new(
  description: "Let's visit the Ubud's monkey forest, home to over 700 long-tailed macaques.",
  cost: 10,
  location: "Jalan Monkey Forest, Ubud, Gianyar, Bali 80571, Indonesia",
  title: "Ubud Monkey Forest",
  date_start: DateTime.new(2022, 7, 3, 9, 0),
  date_end: DateTime.new(2022, 7, 3, 12, 0)
)
monkey_forest.itinerary = ubud_retreat
if monkey_forest.valid?
  monkey_forest.save!
end
puts "3 events created"

dinner = Event.new(
  description: "Let's have a nice dinner with some cocktails",
  cost: 50,
  location: "Jl. Hanoman, Ubud, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571, Indonesia",
  title: "Dinner with cocktails",
  date_start: DateTime.new(2022, 7, 3, 18, 0),
  date_end: DateTime.new(2022, 7, 3, 22, 0)
)
monkey_forest.itinerary = ubud_retreat
if monkey_forest.valid?
  monkey_forest.save!
end
puts "4 events created"

rice_terrace = Event.new(
  description: "The Tegallang rice terrace is famous for its scenic landscape.
                There is a quaint villeage of Pakudui, close to the rice terrace,
                where you can shop for some ornamental woodwork and various carvings of mythical figures",
  cost: 50,
  location: "Jalan Raya Tegallalang, Tegallalang, Gianyar, Bali 80561, Indonesia",
  title: "Day trip to Tegallang Rice Terrace",
  date_start: DateTime.new(2022, 7, 4, 9, 0),
  date_end: DateTime.new(2022, 7, 4, 16, 0)
)
rice_terrace.itinerary = ubud_retreat
if rice_terrace.valid?
  rice_terrace.save!
end
puts "5 events created"

ubud_retreat.published = true
ubud_retreat.save!

puts "Completed creating itinerary 'Relaxing 3D2N Ubud Retreat'"

# Itinerary 3
puts "BALI PARTY:"
puts "Creating a user - Ming Fu..."
mingfu = User.new(
  first_name: "Ming Fu",
  last_name: "Poh",
  email: "pohmingfu@gmail.com",
  password: 12345678,
  age: 28,
  gender: "M",
  languages: "English, Chinese"
)
file = URI.open("https://kitt.lewagon.com/placeholder/users/sllow718")
mingfu.photo.attach(io: file, filename: "#{mingfu.email}-avatar")
mingfu.save
puts "User Ming Fu created"

puts "Creating Itinerary: 'Bali Party'..."
bali_party = Itinerary.new(
  title: "Bali Party",
  participant_limit: 8,
  description: "This trip is going to be so lit, we are going to eat, sleep, party and repeat!",
  published: false,
  destination: "Indonesia",
  deadline: DateTime.new(2022, 7, 1, 12, 0, 0)
)

bali_party.user = mingfu

bali_party_chatroom = Chatroom.new(
  name: "Bali Party"
)

bali_party_chatroom.save!
bali_party.chatroom = bali_party_chatroom
bali_party_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
bali_party_itinerary_user.user = mingfu
bali_party_itinerary_user.itinerary = bali_party
bali_party_itinerary_user.save!
puts "Itinerary 'Bali Party' was created"

puts "Creating events for 'Bali Party'..."
island_hopping = Event.new(
  description: "Let's not restrict ourselves to the mainland, let's go island hopping!",
  cost: 70,
  location: "Nusa Lembongan, Jungutbatu, Kec. Nusa Penida, Kabupaten Klungkung, Bali 80771, Indonesia",
  title: "Island Hopping to Nusa Lembongan",
  date_start: DateTime.new(2022, 8, 20, 9, 0),
  date_end: DateTime.new(2022, 8, 20, 18, 0)
)
island_hopping.itinerary = bali_party
if island_hopping.valid?
  island_hopping.save!
end
puts "1 event created"

party_one = Event.new(
  description: "Let's partayeeee!! We will go bar hopping so get ready to get lit!!",
  cost: 100,
  location: "Jl. Pantai Berawa No.99, Tibubeneng, Badung, Kabupaten Badung, Bali 80361, Indonesia",
  title: "Bar Hopping",
  date_start: DateTime.new(2022, 8, 21, 17, 0),
  date_end: DateTime.new(2022, 8, 21, 23, 0)
)
party_one.itinerary = bali_party
if party_one.valid?
  party_one.save!
end
puts "2 events created"

beach = Event.new(
  description: "Time to relax and wind down at the beach club",
  cost: 50,
  location: "Petitenget St No.51B, Seminyak, Kuta Utara, Badung Regency, Bali 80361, Indonesia",
  title: "Relax at the Beach",
  date_start: DateTime.new(2022, 8, 22, 11, 0),
  date_end: DateTime.new(2022, 8, 22, 15, 0)
)
beach.itinerary = bali_party
if beach.valid?
  beach.save!
end
puts "3 events created"

party_two = Event.new(
  description: "More bar hopping and more drinking!",
  cost: 100,
  location: "Jln Legian No.71, Kuta, Badung Regency, Bali 80361, Indonesia",
  title: "More drunken nights",
  date_start: DateTime.new(2022, 8, 23, 18, 0),
  date_end: DateTime.new(2022, 8, 23, 23, 0)
)
party_two.itinerary = bali_party
if party_two.valid?
  party_two.save!
end
puts "4 events created"

bali_party.published = true
bali_party.save!

puts "Events for 'Bali Party' were created"

puts "Creating reviews for Raymond"

review_one = Review.new(
  content: "Raymond was such a joy to travel with, he took care of our group. Highly recommend joining his trip!"
)

review_one.itinerary = mtmizugaki
review_one.user = mingfu
review_one.save!

puts "Creating reviews for Eunice"

review_two = Review.new(
  content: "Eunice is such a fun person! Very easy going and super spontaneous. Great travel buddy!"
)

review_two.itinerary = ubud_retreat
review_two.user = justinnleong
review_two.save!
