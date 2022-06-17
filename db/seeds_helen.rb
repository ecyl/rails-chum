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
florenceloy.photo.attach(io: file, filename: "#{suansen.email}-avatar")
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
puts "2 events created"

mizugaki_sansou = Event.new(
  description: "Stay at Mizugaki-sansou",
  cost: 100,
  location: "8861 Sutamacho Obi, Hokuto, Yamanashi 408-0101, Japan",
  title: "Stay at Mizugaki-Sansou (guesthouse)",
  date_start: DateTime.new(2022,8,8, 7,15),
  date_end: DateTime.new(2022,8,8,8,15)
)
mizugaki_sansou.itinerary = mtmizugaki
if mizugaki_sansou.valid?
  mizugaki_sansou.save!
end
puts "3 events created"

mtmizugaki.published = true
mtmizugaki.save!

puts "Events for 'A Climbing Trip to Mizugaki' were created"
