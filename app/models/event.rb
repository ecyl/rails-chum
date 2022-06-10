class Event < ApplicationRecord
  belongs_to :itinerary

  # Validations
  validates :title, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :location, presence: true
  validates :cost, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
