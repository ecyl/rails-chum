class ItineraryCalendar < SimpleCalendar::Calendar
  private

  def date_range
    beginning = sorted_events.keys.first
    ending    = sorted_events.keys.last
    (beginning..ending).to_a
  end

end
