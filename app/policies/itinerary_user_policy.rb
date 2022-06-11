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
    record.itinerary.user == user
  end

  def reject?
    record.itinerary.user == user
  end
end
