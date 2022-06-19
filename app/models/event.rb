class Event < ApplicationRecord
  belongs_to :itinerary

  # Validations
  validates :title, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :location, presence: true
  # validates :cost, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # before_validation :update_location
  before_save :reverse_geocode
  # after_save :calculate_itinerary_cost, if: :saved_change_to_cost?


  # For use if the cost column is added to the itinerary table
  # def calculate_itinerary_cost
  #   self.itinerary.cost = self.itinerary.events.pluck(:cost).sum
  #   self.itinerary.save
  # end
  has_one_attached :photo

  def duration
    (date_end - date_start) / 3600
  end

  def update_location
    self.location = "#{self.location} #{self.itinerary.destination}"
  end

  def reverse_geocode
    endpoint = 'mapbox.places'

    url = "https://api.mapbox.com/geocoding/v5/#{endpoint}/#{longitude},#{latitude}.json?access_token=pk.eyJ1IjoiZ2VybWFpbmV3b25nZyIsImEiOiJjbDRnc2x5cHcwMDcyM2NwNHptdDJxYWZmIn0.TDY7BdXEBcnl6aM0xwLrSg"

    mapbox_call = URI.open(url).read
    address = JSON.parse(mapbox_call).dig("features", 1, "place_name")
    self.address = address
  end


  after_commit :set_itinerary_dates

  def set_itinerary_dates
    itinerary.events.each do |event|
      itinerary.start_date = date_start if itinerary.start_date.nil? || date_start < itinerary.start_date
      itinerary.end_date = date_end if itinerary.end_date.nil? || date_end < itinerary.end_date
    end

    itinerary.save
  end
end
