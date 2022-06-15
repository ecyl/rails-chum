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
  # after_save :calculate_itinerary_cost, if: :saved_change_to_cost?

  # For use if the cost column is added to the itinerary table
  # def calculate_itinerary_cost
  #   self.itinerary.cost = self.itinerary.events.pluck(:cost).sum
  #   self.itinerary.save
  # end
  has_one_attached :photo

  after_commit :set_itinerary_dates

  def set_itinerary_dates
    self.itinerary.events.each do |event|
      self.itinerary.start_date = self.date_start if self.date_start < self.itinerary.start_date
      self.itinerary.end_date = self.date_end if self.date_end < self.itinerary.end_date
    end

    self.itinerary.save
  end
end
