# To be deleted
# Everyone creates 3 itineraries - 2 (2d1n) last remaining one (up to you)

puts "––––––––––––––––––––––––––CREATING JAPAN ITINERARIES––––––––––––––––––––––––––"
puts "A CLIMBING TRIP TO MIZUGAKI:"
puts "Creating a user - Florence..."
florenceloy = User.new(
  first_name: "Florence",
  last_name: "Loy",
  email: "florenceloy@gmail.com",
  password: 12345678,
  age: 27,
  gender: "F",
  languages: "English, Chinese"
)
file = URI.open("https://source.unsplash.com/cOe0L1Yp2UA")
florenceloy.photo.attach(io: file, filename: "#{florenceloy.email}-avatar")
florenceloy.save
puts "User Florence created"

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

mtmizugaki.user = florenceloy;

mtmizugaki_chatroom = Chatroom.new(
  name: "A Climbing Trip to Mizugaki"
)

mtmizugaki_chatroom.save!
mtmizugaki.chatroom = mtmizugaki_chatroom
mtmizugaki_itinerary_user = ItineraryUser.new(
  status: "organiser"
)
mtmizugaki_itinerary_user.user = florenceloy
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
mizugaki_camping.itinerary = mtmizugaki
if mizugaki_camping.valid?
  mizugaki_camping.save!
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
osakai.save!

puts "Events for 'Osaka Adventure' were created"
