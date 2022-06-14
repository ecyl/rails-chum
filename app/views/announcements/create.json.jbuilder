if @announcement.persisted?
  json.form json.partial!("announcements/form.html.erb", itinerary: @itinerary, announcement: Announcement.new)
  json.inserted_item json.partial!("itineraries/announcement.html.erb", announcement: @announcement)
else
  json.form json.partial!("announcements/form.html.erb", itinerary: @itinerary, announcement: @announcement)
end
