class ItineraryUserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    true
  end

  def create?
    true
  end

  def accept?
    record.user == @itinerary.user
  end

  def decline?
    record.user == @itinerary.user
  end
end
